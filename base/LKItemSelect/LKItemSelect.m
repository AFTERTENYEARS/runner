//
//  LKItemSelect.m
//  kkiou
//
//  Created by kkiou on 2019/1/12.
//  Copyright © 2019 mac book pro. All rights reserved.
//

#import "LKItemSelect.h"

#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height
#define SCREEN_BOUNDS               [UIScreen mainScreen].bounds
#define STATUS_BAR_HEIGHT           (([[UIScreen mainScreen] bounds].size.height == 812.0f || [[UIScreen mainScreen] bounds].size.height == 896.0f) ? 44.0f : 20.0f)
#define BOTTOM_BAR_HEIGHT           (([[UIScreen mainScreen] bounds].size.height == 812.0f || [[UIScreen mainScreen] bounds].size.height == 896.0f) ? 34.0f : 0.0f)

#define NAVIGATIONBAR_HEIGHT        44.0f
#define TABBAR_HEIGHT               49.0f
#define STATUS_NAV_BAR_HEIGHT       (STATUS_BAR_HEIGHT + NAVIGATIONBAR_HEIGHT)

/**
 *  Views
 */
#define VIEW_WIDTH(view)            view.frame.size.width
#define VIEW_HEIGHT(view)           view.frame.size.height
#define VIEW_X(view)                view.frame.origin.x
#define VIEW_Y(view)                view.frame.origin.y
#define VIEW_LEFT(view)             view.frame.origin.x
#define VIEW_TOP(view)              view.frame.origin.y
#define VIEW_BOTTOM(view)           CGRectGetMaxY(view.frame)
#define VIEW_RIGHT(view)            CGRectGetMaxX(view.frame)

#define CELL_HEIGHT 44.0
#define TABLE_HEIGHT 320.0
#define CONTROL_HEIGHT 49.0

@class LKItemSelect;

LKItemSelect *lKItemSelect;

UIView *tapView;
UIView *controlView;
UITableView *tableView;
NSArray *currentDataArray;

NSString *item;
NSInteger idx;

ClickItemCallback currentClickItemCallback;

@interface LKItemSelect()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LKItemSelect

+ (void)showWithDataArray:(NSArray *)dataArray clickItemCallback:(ClickItemCallback)clickItemCallback {
    if (!lKItemSelect) {
        [LKItemSelect allViewsInit];
    }
    
    currentDataArray = dataArray;
    currentClickItemCallback = clickItemCallback;
    
    CGRect before = CGRectMake(0, SCREEN_HEIGHT + CONTROL_HEIGHT, SCREEN_WIDTH, TABLE_HEIGHT + BOTTOM_BAR_HEIGHT);
    CGRect after = CGRectMake(0, SCREEN_HEIGHT - TABLE_HEIGHT - BOTTOM_BAR_HEIGHT, SCREEN_WIDTH, TABLE_HEIGHT + BOTTOM_BAR_HEIGHT);
    tableView.frame = before;
    
    CGRect controlBefore = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, CONTROL_HEIGHT);
    CGRect controlAfter = CGRectMake(0, SCREEN_HEIGHT - TABLE_HEIGHT - BOTTOM_BAR_HEIGHT - CONTROL_HEIGHT, SCREEN_WIDTH, CONTROL_HEIGHT);
    controlView.frame = controlBefore;
    
    [[UIApplication sharedApplication].keyWindow addSubview:lKItemSelect];
    
    // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
    [UIView animateWithDuration: 0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.9 options:0 animations:^{
        tableView.frame = after;
        controlView.frame = controlAfter;
    } completion:^(BOOL finished) {
        
    }];
    [tableView reloadData];
}


+ (void)allViewsInit {
    lKItemSelect = [[LKItemSelect alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    lKItemSelect.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABLE_HEIGHT - BOTTOM_BAR_HEIGHT)];
    UITapGestureRecognizer *tapSelectUsageTypesView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelectInterestRateView:)];
    [tapView addGestureRecognizer:tapSelectUsageTypesView];
    [lKItemSelect addSubview:tapView];
    
    controlView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height - BOTTOM_BAR_HEIGHT - TABLE_HEIGHT - CONTROL_HEIGHT, Screen_Width, CONTROL_HEIGHT)];
    controlView.backgroundColor = FAFAFA;
    
    UIView *lineTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0.5)];
    lineTop.backgroundColor = COLOR(@"e5e5e5");
    [controlView addSubview:lineTop];
    
    UIView *lineBot = [[UIView alloc] initWithFrame:CGRectMake(0, CONTROL_HEIGHT - 0.5, Screen_Width, 0.5)];
    lineBot.backgroundColor = COLOR(@"e5e5e5");
    [controlView addSubview:lineBot];
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeSystem];
    cancel.frame = CGRectMake(0, 0, 100, 49);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancel setTitleColor:COLOR(@"999999") forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [controlView addSubview:cancel];
    
    UIButton *confirm = [UIButton buttonWithType:UIButtonTypeSystem];
    confirm.frame = CGRectMake(Screen_Width - 100, 0, 100, 49);
    [confirm setTitle:@"确定" forState:UIControlStateNormal];
    confirm.titleLabel.font = [UIFont systemFontOfSize:16];
    [confirm setTitleColor:COLOR(@"e95f4f") forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    [controlView addSubview:confirm];
    
    [lKItemSelect addSubview:controlView];
    
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TABLE_HEIGHT - BOTTOM_BAR_HEIGHT, SCREEN_WIDTH, TABLE_HEIGHT + BOTTOM_BAR_HEIGHT) style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.delegate = lKItemSelect;
    tableView.dataSource = lKItemSelect;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.backgroundColor = FAFAFA;
    
    [lKItemSelect addSubview:tableView];
    
    currentDataArray = [[NSArray alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return currentDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.backgroundColor = FAFAFA;
    cell.contentView.backgroundColor = indexPath.row == idx ? COLOR(@"F9F1F1") : COLOR(@"fafafa");
    cell.contentView.layer.borderWidth = indexPath.row == idx ? 0.5f : 0.0f;
    cell.contentView.layer.borderColor = indexPath.row == idx ? COLOR(@"e94f4f").CGColor : FAFAFA.CGColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CELL_HEIGHT)];
    label.textAlignment = 1;
    label.textColor = indexPath.row == idx ? COLOR(@"e94f4f") : COLOR(@"999999");
    label.font = [UIFont systemFontOfSize:16];
    [cell.contentView addSubview:label];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, CELL_HEIGHT - 0.5, SCREEN_WIDTH, 0.5);
    lineView.backgroundColor = E5E5E5;
    [cell.contentView addSubview:lineView];
    
    label.text = currentDataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    idx = indexPath.row;
    item = currentDataArray[indexPath.row];
    
    [tableView reloadData];
}

+ (void)tapSelectInterestRateView:(UIView *)view {
    [lKItemSelect removeFromSuperview];
}

+ (void)dismiss:(UIButton *)button {
    [lKItemSelect removeFromSuperview];
}

+ (void)confirm:(UIButton *)button {
    currentClickItemCallback(currentDataArray[idx], idx);
    [lKItemSelect removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

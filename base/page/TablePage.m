//
//  TablePage.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "TablePage.h"
#import <MJRefresh.h>

@interface TablePage ()

@property (nonatomic, assign) CGRect tableView_frame;

@end

@implementation TablePage

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableProtocol];
    [self.view addSubview:self.tableView];
}

- (void)configTableProtocol {
    
}

- (void)setMj_callback:(MJ_Callback)mj_callback {
    _mj_callback = mj_callback;
    MJRefreshHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        
        dispatch_queue_t queue =  dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^{
            if (mj_callback) {
                mj_callback();
            }
        });
        //监测到当前线程池前边的线程全部执行完毕
        dispatch_barrier_async(queue, ^{
            [self.tableView.mj_header endRefreshing];
        });
        
    }];
    
    self.tableView.mj_header = header;
}

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.tableView_frame style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"PushCell" bundle:nil] forCellReuseIdentifier:push_cell];
    [_tableView registerNib:[UINib nibWithNibName:@"PlaceHolderCell" bundle:nil] forCellReuseIdentifier:place_holder_cell_identifier];
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    return _tableView;
}

- (CGRect)tableView_frame {
    return self.return_tableView_frame;
}

- (CGRect)return_tableView_frame {
    return CGRectMake(0, self.return_nav_bar.height, Screen_Width, Screen_Height - self.return_nav_bar.height);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

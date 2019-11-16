//
//  Nav.m
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKNav.h"

@interface LKNav ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *left_items_view;
@property (nonatomic, strong) UIView *right_items_view;

@end

@implementation LKNav

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, Screen_Width, Status_Nav_Bar_Height);
        self.backgroundColor = UIColor.whiteColor;
        self.clipsToBounds = YES;
        [self addSubview:self.backImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.left_items_view];
        [self addSubview:self.right_items_view];
        [self addSubview:self.backItem];
        
    }
    return self;
}

+ (LKNav *)backStyleWithTitle:(NSString *)title {
    LKNav *backNav = [[LKNav alloc] init];
    backNav.title = title;
    backNav.backItem.hidden = NO;
    return backNav;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

- (void)setThemeColor:(UIColor *)themeColor {
    _themeColor = themeColor;
    self.titleLabel.textColor = themeColor;
    [self.backItem setTitleColor:themeColor forState:UIControlStateNormal];
}

- (void)setFont:(NSInteger)fontSize {
    _fontSize = fontSize;
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    if (imageUrl.length > 0) {
        self.backImageView.image = [UIImage imageNamed:imageUrl];
    }
}

- (void)setLeft_items:(NSArray<UIButton *> *)left_items {
    if (left_items.count > 0 && self.backItem.hidden == NO) {
        self.backItem.hidden = YES;
    }
    _left_items = left_items;
    for (UIView *subView in self.left_items_view.subviews) {
        [subView removeFromSuperview];
    }
    for (NSInteger i = 0; i < left_items.count; i++) {
        UIButton *item = left_items[i];
        CGFloat width = 16;
        for (NSInteger j = 0; j < i; j++) {
            UIButton *addWidthItem = left_items[j];
            width += View_Width(addWidthItem);
            width += 16;
        }
        UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(width, 0, View_Width(item), Nav_Bar_Height)];
        item.frame = CGRectMake(0, (Nav_Bar_Height - View_Height(item)) / 2.0, View_Width(item), View_Height(item));
        [buttonContainer addSubview:item];
        [self.left_items_view addSubview:buttonContainer];
    }
}

- (void)setRight_items:(NSArray<UIButton *> *)right_items {
    NSMutableArray * tmp_items = [NSMutableArray arrayWithArray:right_items];
    NSArray *reverse_items = [[tmp_items reverseObjectEnumerator] allObjects];
    _right_items = reverse_items;
    for (UIView *subView in self.right_items_view.subviews) {
        [subView removeFromSuperview];
    }
    for (NSInteger i = 0; i < reverse_items.count; i++) {
        UIButton *item = reverse_items[i];
        CGFloat width = 16;
        for (NSInteger j = 0; j < i; j++) {
            UIButton *addWidthItem = reverse_items[j];
            width += View_Width(addWidthItem);
            width += 16;
        }
        width += View_Width(item);
        UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(View_Width(self.right_items_view) - width, 0, View_Width(item), Nav_Bar_Height)];
        item.frame = CGRectMake(0, (Nav_Bar_Height - View_Height(item)) / 2.0, View_Width(item), View_Height(item));
        [buttonContainer addSubview:item];
        [self.right_items_view addSubview:buttonContainer];
    }
}

- (UIImageView *)backImageView {
    if (_backImageView) {
        return _backImageView;
    }
    _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Status_Nav_Bar_Height)];
    _backImageView.backgroundColor = UIColor.clearColor;
    _backImageView.contentMode = UIViewContentModeScaleAspectFill;
    return _backImageView;
}

- (UIButton *)backItem {
    if (_backItem) {
        return _backItem;
    }
    _backItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backItem setImage:[UIImage new] forState:UIControlStateNormal];
    _backItem.frame = CGRectMake(0, Status_Bar_Height, 44, 44);
    [_backItem setTitle:@"←" forState:UIControlStateNormal];
    [_backItem setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_backItem setTitleColor:UIColor.lightGrayColor forState:UIControlStateHighlighted];
    _backItem.titleLabel.font = [UIFont systemFontOfSize:26];
    [_backItem addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _backItem.hidden = YES;
    return _backItem;
}

- (void)back {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    [currentVC.navigationController popViewControllerAnimated:YES];
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Status_Bar_Height, Screen_Width, Nav_Bar_Height)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    _titleLabel.textColor = UIColor.blackColor;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    return _titleLabel;
}

- (UIView *)left_items_view {
    if (_left_items_view) {
        return _left_items_view;
    }
    _left_items_view = [[UIView alloc] initWithFrame:CGRectMake(0, Status_Bar_Height, Screen_Width / 2.0, Nav_Bar_Height)];
    return _left_items_view;
}

- (UIView *)right_items_view {
    if (_right_items_view) {
        return _right_items_view;
    }
    _right_items_view = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width / 2.0, Status_Bar_Height, Screen_Width / 2.0, Nav_Bar_Height)];
    return _right_items_view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

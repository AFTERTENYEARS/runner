//
//  SuccessPage.m
//  runner
//
//  Created by runner on 2019/11/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "SuccessPage.h"

@interface SuccessPage ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) LightLKButton *backButton;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UILabel *subDescribeLabel;

@property (nonatomic, strong) NSTimer *backTimer;

@property (nonatomic, assign) NSInteger leftTime;

@end

@implementation SuccessPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = E5E5E5;
    [self.tableView addSubview:self.contentView];
    
    
    
    if (self.describe.length > 0) {
        UILabel *describeLabel = self.contentView.subviews[1];
        describeLabel.text = self.describe;
    }
    self.subDescribeLabel.text = self.subDescribe;
    if (self.iconName.length > 0) {
        self.icon.image = [UIImage imageNamed:self.iconName];
    }
    
    _leftTime = 5;
    
    __weak typeof(self) weakSelf = self;
    [RACObserve(self, leftTime) subscribeNext:^(id  _Nullable x) {
        self.backButton.titleLabel.text = [NSString stringWithFormat:@"%lds后返回...", weakSelf.leftTime];
        [self.backButton setTitle:[NSString stringWithFormat:@"%lds后返回...", weakSelf.leftTime] forState:UIControlStateNormal];
        if (weakSelf.leftTime <= 0) {
            [weakSelf timePassOver];
        }
    }];
    
    self.backButton.click = ^{
        [weakSelf timePassOver];
    };
        
    self.backTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timePassed) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.backTimer forMode:NSRunLoopCommonModes];
}

- (void)timePassed {
    self.leftTime -= 1;
}

- (void)timePassOver {
    [self.backTimer invalidate];
    [[Func currentVC].navigationController popViewControllerAnimated:YES];
}

- (UIView *)return_nav_bar {
//    LKNav *nav = [LKNav backStyleWithTitle:@""];
//    nav.backgroundColor = COLOR(@"fafafa");
//    [nav.backItem setTitle:@"" forState:UIControlStateNormal];
//    [nav.backItem setImage:Image_By_Name(@"current-back-red") forState:UIControlStateNormal];
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, Status_Bar_Height, Screen_Width - 42 * 2, Nav_Bar_Height)];
//    titleLabel.textColor = E94F4f;
//    titleLabel.font = [UIFont boldSystemFontOfSize:19];
//    titleLabel.text = @"操作成功";
//    [nav addSubview:titleLabel];
    
    NSString *title = @"操作成功";
    if (self.navTitle.length > 0) {
        title = self.navTitle;
    }

    LKNav *nav = [Func navByTitle:title];
    
    return nav;
}

- (void)dealloc {
    [self.backTimer invalidate];
}

- (UIView *)contentView {
    if (_contentView) {
        return _contentView;
    }
    _contentView = View_By_Xib(@"SuccessView");
    _contentView.frame = CGRectMake(0, 0.5, Screen_Width, Screen_Height - Status_Nav_Bar_Height);
    return _contentView;
}

- (LightLKButton *)backButton {
    return self.contentView.subviews[2];
}

- (UIImageView *)icon {
    return self.contentView.subviews[0];
}

- (UILabel *)describeLabel {
    return self.contentView.subviews[1];
}

- (UILabel *)subDescribeLabel {
    return self.contentView.subviews[3];
}


@end

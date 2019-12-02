//
//  PasswordPage.m
//  runner
//
//  Created by runner on 2019/11/14.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PasswordPage.h"
#import "PwdView.h"

@interface PasswordPage ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) LKButton *closeButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) PwdView *pwdView;

@end

@implementation PasswordPage

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        self.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0);
        [UIView animateWithDuration:0.1 animations:^{
            self.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0.22);
        } completion:^(BOOL finished) {
            [self configUI];
            // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
            [UIView animateWithDuration: 0.1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.9 options:0 animations:^{
                self.contentView.frame = CGRectMake(16, 62 + Status_Nav_Bar_Height, self.contentView.width, self.contentView.height);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
    return self;
}

- (void)setTexts:(NSArray<NSString *> *)texts {
    _texts = texts;
}

- (void)configUI {
    [self addSubview:self.contentView];
    _titleLabel.text = _texts[0];
    _subTitleLabel.text = _texts[1];
    _amountLabel.text = _texts[2];
    _describeLabel.text = _texts[3];
}


- (UIView *)contentView {
    if (_contentView) {
        return _contentView;
    }
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(16, (Screen_Height - 260) / 2.0, Screen_Width - 32, 240)];
    _contentView.backgroundColor = FAFAFA;
    _contentView.layer.masksToBounds = YES;
    _contentView.layer.cornerRadius = 5.0f;
    
    [_contentView addSubview:self.closeButton];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 47.5, _contentView.width, 0.5)];
    line.backgroundColor = E5E5E5;
    [_contentView addSubview:line];
    
    [_contentView addSubview:self.titleLabel];
    [_contentView addSubview:self.subTitleLabel];
    [_contentView addSubview:self.amountLabel];
    [_contentView addSubview:self.describeLabel];
    [_contentView addSubview:self.pwdView];
    
    return _contentView;
}

- (LKButton *)closeButton {
    if (_closeButton) {
        return _closeButton;
    }
    _closeButton = [[LKButton alloc] init];
    _closeButton.frame = CGRectMake(0, 0, 48, 48);
    [_closeButton setImage:[UIImage imageNamed:@"FLogin-close"] forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    _closeButton.click = ^{
        [weakSelf removeFromSuperview];
    };
    return _closeButton;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, 48)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.textColor = COLOR(@"333333");
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"请输入提现密码";
    return _titleLabel;
}


- (UILabel *)subTitleLabel {
    if (_subTitleLabel) {
        return _subTitleLabel;
    }
    _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 44 + 27, self.contentView.width, 26)];
    _subTitleLabel.font = [UIFont boldSystemFontOfSize:12];
    _subTitleLabel.textColor = COLOR(@"333333");
    _subTitleLabel.textAlignment = NSTextAlignmentCenter;
    _subTitleLabel.text = @"余额提现";
    return _subTitleLabel;
}

- (UILabel *)amountLabel {
    if (_amountLabel) {
        return _amountLabel;
    }
    _amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 44 + 27 + 26, self.contentView.width, 32)];
    _amountLabel.font = [UIFont systemFontOfSize:24];
    _amountLabel.textColor = E94F4F;
    _amountLabel.textAlignment = NSTextAlignmentCenter;
    _amountLabel.text = @"3754.4";
    return _amountLabel;
}

- (UILabel *)describeLabel {
    if (_describeLabel) {
        return _describeLabel;
    }
    _describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 44 + 27 + 26 + 32, self.contentView.width, 26)];
    _describeLabel.font = [UIFont systemFontOfSize:12];
    _describeLabel.textColor = COLOR(@"999999");
    _describeLabel.textAlignment = NSTextAlignmentCenter;
    _describeLabel.text = @"个人所得税：3.20";
    return _describeLabel;
}

- (PwdView *)pwdView {
    if (_pwdView) {
        return _pwdView;
    }
    _pwdView = [[PwdView alloc] initWithLength:6 pwdCallback:^(NSString * _Nonnull pwd) {
        if (self.pwdCallBack) {
            self.pwdCallBack(pwd);
        }
        [self removeFromSuperview];
    }];
    _pwdView.frame = CGRectMake((self.contentView.width - _pwdView.width) / 2.0, self.contentView.height - 24 - _pwdView.height, _pwdView.width, _pwdView.height);
    return _pwdView;
}


@end

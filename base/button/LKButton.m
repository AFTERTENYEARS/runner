//
//  LKButton.m
//  runner
//
//  Created by runner on 2019/9/11.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKButton.h"

@implementation LKButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self customInit];
}

- (void)customInit {
    
}

- (void)setClick:(Click)click {
    _click = click;
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click:(UIButton *)sender {
    if (_click) {
        _click();
    }
}

- (void)customNormalColor:(UIColor *)normalColor highLightedColor:(UIColor *)highLightedColor disabledColor:(UIColor *)disabledColor titleNormalColor:(UIColor *)titleNormalColor titleHilightedColor:(UIColor *)titleHilightedColor{
    self.backgroundColor = [UIColor clearColor];
    self.normalColor = normalColor;
    self.highLightedColor = highLightedColor;
    self.disabledColor = disabledColor;
    self.titleNormalColor = titleNormalColor;
    self.titleHilightedColor = titleHilightedColor;
    [self setBackgroundImage:[self createImageWithColor:normalColor] forState: UIControlStateNormal];
    [self setBackgroundImage:[self createImageWithColor:highLightedColor] forState: UIControlStateHighlighted];
    [self setBackgroundImage:[self createImageWithColor:disabledColor] forState: UIControlStateDisabled];
    [self setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [self setTitleColor:titleHilightedColor forState:UIControlStateHighlighted];
}

- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        if (self.highLightedColor) {
            [self setBackgroundImage:[self createImageWithColor:self.highLightedColor] forState: UIControlStateNormal];
        }
        if (self.titleHilightedColor) {
            [self setTitleColor:self.titleHilightedColor forState:UIControlStateNormal];
        }
    } else {
        if (self.normalColor) {
            [self setBackgroundImage:[self createImageWithColor:self.normalColor] forState: UIControlStateNormal];
        }
        if (self.titleNormalColor) {
            [self setTitleColor:self.titleNormalColor forState:UIControlStateNormal];
        }
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 10, 10);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

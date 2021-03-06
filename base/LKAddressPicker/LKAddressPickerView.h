//
//  LKAddressPickerView.h
//  LKAddressPicker-OC
//
//  Created by Ethan.Wang on 2018/9/14.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKAddressModel.h"
typedef void(^backLocation)(NSString *address, NSString *province, NSString *city, NSString *area);
typedef void(^backCancel)(void);
@interface LKAddressPickerView : UIView
/// 返回数据回调
@property (nonatomic,copy) backLocation backLocationString;
/// 推出回调
@property (nonatomic,copy) backCancel backOnClickCancel;
/// title及下划线选中颜色
@property (nonatomic,strong) UIColor *selectColor;

-(instancetype)initWithFrame:(CGRect)frame selectColor:(UIColor *)selectColor;
@end

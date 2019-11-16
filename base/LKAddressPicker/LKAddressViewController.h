//
//  LKAddressViewController.h
//  LKAddressPicker-OC
//
//  Created by Ethan.Wang on 2018/9/14.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKAddressPickerView.h"
@interface LKAddressViewController : UIViewController

@property (nonatomic,strong) UIView *backgroundView;
@property (nonatomic,strong) LKAddressPickerView *containV;
@property (nonatomic,copy) backLocation backLocationString;

@end

//
//  PushCell.h
//  runner
//
//  Created by runner on 2019/11/12.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@property (nonatomic, assign) BOOL hideArrow;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrow_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *value_right_space;

@end

NS_ASSUME_NONNULL_END

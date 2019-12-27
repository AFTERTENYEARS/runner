//
//  VersionUpdateView.h
//  runner
//
//  Created by runner on 2019/12/9.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VersionUpdateView : UIView

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet LightLKButton *refuseButton;
@property (weak, nonatomic) IBOutlet DeepLKButton *updateNow;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;

@property (nonatomic, strong) NSString *content;

@end

NS_ASSUME_NONNULL_END

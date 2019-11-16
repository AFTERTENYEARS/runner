//
//  PlaceHolderCell.h
//  runner
//
//  Created by runner on 2019/10/23.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightLKButton.h"

typedef void(^ControlCallback)(void);

NS_ASSUME_NONNULL_BEGIN

@interface PlaceHolderCell : UITableViewCell

@property (nonatomic, copy) ControlCallback callback;

@property (weak, nonatomic) IBOutlet UIImageView *placeHolderImageView;
@property (weak, nonatomic) IBOutlet UILabel *describle;
@property (weak, nonatomic) IBOutlet UILabel *subDescrible;
@property (weak, nonatomic) IBOutlet LightLKButton *controlButton;


@end

NS_ASSUME_NONNULL_END

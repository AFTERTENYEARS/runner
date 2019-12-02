//
//  AnimationImageView.m
//  runner
//
//  Created by runner on 2019/10/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "AnimationImageView.h"

@interface AnimationImageView ()

@end

@implementation AnimationImageView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width / 2.0 - 120, 260, 240, 160)];
    NSArray *names = @[@"Image-1",
    @"Image-2",
    @"Image-3",
    @"Image-4",
    @"Image-5",
    @"Image-6",
    @"Image-7",
    @"Image-8",
    @"Image-9",
    @"Image-10",
    @"Image-11",
    @"Image-12",
    @"Image-13",
    @"Image-14",
    @"Image-15",
    @"Image-16",];
    
    NSMutableArray *images = [NSMutableArray new];
    for (NSString *name in names) {
        [images addObject:[UIImage imageNamed:name]];
    }
    imageView.image = images[0];
    imageView.animationImages = images;
    imageView.animationDuration = 0.8;
    imageView.animationRepeatCount = 0;
    
    [imageView startAnimating];
    
    [self.view addSubview:imageView];
}

- (UIView *)return_nav_bar {
    return [LKNav backStyleWithTitle:@"KLZ"];
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

//
//  VCViewModel.m
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "VCViewModel.h"

@implementation VCViewModel

- (void)refreshWithCallback:(refreshCallback)callback {
    DELAY_EXECUTE(1, callback(@[@(1), @(2)]));
}

@end

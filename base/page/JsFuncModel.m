//
//  JsFuncModel.m
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "JsFuncModel.h"

@implementation JsFuncModel

- (instancetype)initWithName:(NSString *)name callback:(Callback)callback {
    self = [super init];
    if (self) {
        self.name = name;
        self.callback = callback;
    }
    return self;
}

@end

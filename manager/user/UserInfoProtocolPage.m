//
//  UserInfoProtocolPage.m
//  runner
//
//  Created by runner on 2019/11/4.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "UserInfoProtocolPage.h"

@interface UserInfoProtocolPage ()

@end

@implementation UserInfoProtocolPage

- (instancetype)init {
    self = [super init];
    if (self) {
        [UserLoginInfo addDelegate:self];
    }
    return self;
}

- (void)dealloc {
    [UserLoginInfo removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)userInfoUpdate {
    
}

@end

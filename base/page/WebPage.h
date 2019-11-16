//
//  WebPage.h
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "Page.h"
#import "JsFuncModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WebPage : Page

- (void)clearJs;

- (void)initListner;

- (void)initData;

- (void)loadH5: (NSString *)name;

- (void)addJsFunc:(NSString *)name callback:(Callback)callback;

- (void)addJsObj:(NSString *)key value: (NSString *)value;

@end

NS_ASSUME_NONNULL_END

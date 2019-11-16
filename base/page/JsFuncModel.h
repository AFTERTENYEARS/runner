//
//  JsFuncModel.h
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Callback)(id);

@interface JsFuncModel : NSObject

- (instancetype)initWithName:(NSString *)name callback:(Callback)callback;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, copy) Callback callback;

@end

NS_ASSUME_NONNULL_END

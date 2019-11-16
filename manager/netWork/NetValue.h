//
//  NetValue.h
//  runner
//
//  Created by runner on 2019/9/4.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetValue : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSDictionary *parameters;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSDictionary *body;
@property (nonatomic, copy) NSString *msg;

- (NSDictionary *)toDictionary;
- (NSString *)toJSON;

@end

NS_ASSUME_NONNULL_END

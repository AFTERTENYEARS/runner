//
//  NetWork.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetValue.h"

typedef NS_ENUM(NSUInteger, NetWorkType) {
    get,
    post,
    put,
    delet,
};

typedef NS_ENUM(NSUInteger, Loading) {
    defaul,
    block,
    none,
};

typedef void (^DownloadProgress)(NSProgress * _Nonnull progress);
typedef void (^NetCallBack)(NetValue * _Nonnull netValue);

NS_ASSUME_NONNULL_BEGIN

@interface NetWork : NSObject

+ (void)request:(NetWorkType)type url:(NSString *)url parameters:(id _Nullable)parameters progress:(DownloadProgress  _Nullable)progress loading:(Loading)loading netCallBack: (NetCallBack)netCallBack;

+ (void)cancel;

@end

NS_ASSUME_NONNULL_END

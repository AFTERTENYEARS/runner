//
//  VCViewModel.h
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^refreshCallback)(NSArray * _Nullable models);

NS_ASSUME_NONNULL_BEGIN

@interface VCViewModel : NSObject

@property (nonatomic, strong) NSArray *models;

- (void)refreshWithCallback:(refreshCallback)callback;

@end

NS_ASSUME_NONNULL_END

//
//  ViewControllerTableProtocol.h
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "TableProtocol.h"
#import "VCViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerTableProtocol : TableProtocol

@property (nonatomic, strong) VCViewModel *VCVM;

@property (nonatomic, strong) NSArray *views;

@end

NS_ASSUME_NONNULL_END

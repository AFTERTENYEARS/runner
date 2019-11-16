//
//  TableProtocol.h
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//cell点击回调
typedef void (^CellClick) (NSInteger section, NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface TableProtocol : NSObject<UITableViewDelegate, UITableViewDataSource>

/* cell点击回调 */
@property (copy, nonatomic) CellClick cellClick;

@property (nonatomic, strong) NSString *identifier;

- (instancetype)initWithIdentifier: (NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

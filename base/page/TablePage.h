//
//  TablePage.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "Page.h"
#import "TableProtocol.h"
#import "PushCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^MJ_Callback)(void);
typedef void(^MJ_More_Callback)(void);

@interface TablePage : Page

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) MJ_Callback mj_callback;
@property (nonatomic, copy) MJ_More_Callback mj_more_callback;

//tableView_frame(默认白色)
- (CGRect)return_tableView_frame;

- (void)configTableProtocol;

@end

NS_ASSUME_NONNULL_END

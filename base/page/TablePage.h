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

@interface TablePage : Page

@property (nonatomic, strong) UITableView *tableView;

//tableView_frame(默认白色)
- (CGRect)return_tableView_frame;

- (void)configTableProtocol;

@end

NS_ASSUME_NONNULL_END

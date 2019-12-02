//
//  PageDefaultTableProtocol.m
//  runner
//
//  Created by runner on 2019/10/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PageDefaultTableProtocol.h"

@interface PageDefaultTableProtocol ()

@property (nonatomic, strong) NSArray *titles;

@end

@implementation PageDefaultTableProtocol

- (instancetype)init {
    self = [super init];
    if (self) {
        _titles = @[@"登录", @"图表", @"gif", @"登录注册", @"支付宝支付测试"];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifier];
    }
    
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

@end

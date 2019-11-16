//
//  ViewControllerTableProtocol.m
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "ViewControllerTableProtocol.h"

@implementation ViewControllerTableProtocol

- (void)setViews:(NSArray *)views {
    _views = views;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = _views[indexPath.row];
    return view.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _views.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifier];
    }
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *view = _views[indexPath.row];
    [cell.contentView addSubview:view];
    return cell;
}

@end

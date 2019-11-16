//
//  PageDefaultTableProtocol.m
//  runner
//
//  Created by runner on 2019/10/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PageDefaultTableProtocol.h"

@implementation PageDefaultTableProtocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifier];
    }
    NSArray *titles = @[@"图表", @"图表", @"gif", @"gif"];
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

@end

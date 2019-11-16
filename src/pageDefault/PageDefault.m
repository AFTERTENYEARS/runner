//
//  PageDefault.m
//  runner
//
//  Created by runner on 2019/10/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PageDefault.h"
#import "PageDefaultTableProtocol.h"
#import "ViewController.h"
#import "AnimationImageView.h"

@interface PageDefault ()

@property (nonatomic, strong) PageDefaultTableProtocol *protocol;

@end

@implementation PageDefault

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIView *)return_nav_bar {
    LKNav *nav = [[LKNav alloc] init];
    nav.backgroundColor = UIColor.brownColor;
    nav.title = @"KLZ";
    return nav;
}

- (void)configTableProtocol {
    self.protocol = [[PageDefaultTableProtocol alloc] init];
    self.tableView.delegate = self.protocol;
    self.tableView.dataSource = self.protocol;
    __weak typeof(self) weakSelf = self;
    self.protocol.cellClick = ^(NSInteger section, NSInteger index) {
        if (index == 0) {
            [weakSelf.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
        }
        if (index == 1) {
            [weakSelf.navigationController pushViewController:[ViewController new] animated:YES];
        }
        if (index == 2) {
            [weakSelf.navigationController pushViewController:[AnimationImageView new] animated:YES];
        }
        if (index == 3) {
            [weakSelf.navigationController pushViewController:[AnimationImageView new] animated:YES];
        }
    };
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

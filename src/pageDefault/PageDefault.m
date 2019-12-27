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
            //[weakSelf.navigationController pushViewController:[[LoginPage alloc] init] animated:YES];
        }
        if (index == 1) {
            [weakSelf.navigationController pushViewController:[ViewController new] animated:YES];
        }
        if (index == 2) {
            [weakSelf.navigationController pushViewController:[AnimationImageView new] animated:YES];
        }
        if (index == 3) {
            //[weakSelf.navigationController pushViewController:[FLoginPage new] animated:YES];
        }
        if (index == 4) {
            [LKAlertView alertTitle:@"提示" msg:@"跳转支付？" l:@"取消" lcb:^{
                
            } r:@"确定" rcb:^{
//                [[AlipaySDK defaultService] payOrder:@"alipay_sdk=alipay-sdk-java-4.7.1.ALL&app_id=2019112169374183&biz_content=%7B%22body%22%3A%22M4A1%22%2C%22out_trade_no%22%3A%22648524498588545024%22%2C%22subject%22%3A%22M4A1M4A1%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A%220.01%22%7D&charset=utf-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fqq928596166.imwork.net%2Fvba-api%2Forder%2Fnotify%2FaliNotify&sign=fxBDIhg8RakDGIIZrHZdJ%2BWPiezNRjMBuBDtfMJbIy%2BmhUzDwP3GbtgI%2FRQEn4iFoZPQv7xZy5p%2F3frQgNSIDxVTwmaUSYvrNqcE1ho75%2FU0sMdZEMS2yPVcG%2FdHWz64PgBIAPuBODxH2wkuP9XF7eE4aEyTKaUkpJIs2HSYpjh4hFRGhqlysurpM76tOHwn9AldwPF8Wh4Bd2Y6bM%2BVR1PGAuXYGVyxPKm1Y8p3VkM0dxqppZrdzykYVe4m2%2BTu5M2OQLovTLC5lGJOL8y%2FvWW2TTRNxciJVwRo7D4CEvxrhK2yQLND6Etibl2OXZHK%2Fm2UB6rGpA%2FXF4HMNIsaAg%3D%3D&sign_type=RSA2&timestamp=2019-11-25+14%3A04%3A49&version=1.0" fromScheme:@"lishuazhanggui" callback:^(NSDictionary *resultDic) {
//                    NSLog(@"reslut = %@",Json_By_Dic(resultDic));
//                    [Func toast:Json_By_Dic(resultDic)];
//                }];r
            }];
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

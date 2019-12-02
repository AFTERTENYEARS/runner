//
//  TabbarPage.m
//  runner
//
//  Created by runner on 2019/9/4.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "TabbarPage.h"
#import "PageDefault.h"
#import <AFNetworking.h>

#define DeepColor COLOR(@"E94F4F")
#define LightColor COLOR(@"999999")
//#define DeepIcon @[@"123", @"456"]
//#define LightIcon @[@"123", @"456"]

@interface TabbarPage ()

@property (nonatomic, strong) UIView *tabbarView;
@property (nonatomic, strong) NSArray<UIButton *> *items;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) NSArray<UIView *> *contentViews;

@property (nonatomic, strong) NSArray<UIImage *> *normalImages;
@property (nonatomic, strong) NSArray<UIImage *> *hilightImages;

@end

@implementation TabbarPage

- (void)viewDidLoad {
    [super viewDidLoad];
    _normalImages = @[
        //Image_By_Name(@"tabbar_my_normal"),
                      Image_By_Name(@"tabbar_home_normal"),
                      Image_By_Name(@"tabbar_team_normal"),
                      Image_By_Name(@"tabbar_my_normal")];
    _hilightImages = @[
        //Image_By_Name(@"tabbar_my_hilight"),
                       Image_By_Name(@"tabbar_home_hilight"),
                       Image_By_Name(@"tabbar_team_hilight"),
                       Image_By_Name(@"tabbar_my_hilight")];
    
    [self configViewControllers];
    [self configUI];
    [self.view addSubview:self.tabbarView];
    [self visableAtFirst];
}

- (void)configUI {
    NSArray<NSString *> *itemNames = @[
                                        //@"test",
                                       @"首页",
                                       @"团队",
                                       @"我的"];
    
    CGFloat marginTop = 5.0f;
    
    CGFloat button_w = Screen_Width / itemNames.count;
    CGFloat button_h = Tabbar_Height + Control_Bar_Height;
    
    CGFloat image_w = 23.0f;
    CGFloat image_h = 23.0f;
    
    CGFloat label_w = 23.0f;
    CGFloat label_h = 14.0f;
    
    NSMutableArray *mutableItems = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < itemNames.count; i++) {
        
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(i * button_w, 0, button_w, button_h);
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake((button_w  - image_w) / 2.0, marginTop, image_w, image_h);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = _normalImages[i];
        
        UILabel *itemLabel = [[UILabel alloc] init];
        itemLabel.frame = CGRectMake((button_w - label_w) / 2.0, marginTop + image_h + 3, label_w, label_h);
        itemLabel.text = itemNames[i];
        itemLabel.font = [UIFont systemFontOfSize:10];
        itemLabel.textColor = [UIColor blackColor];
        itemLabel.textAlignment = NSTextAlignmentCenter;
        
        [button addSubview:imageView];
        [button addSubview:itemLabel];
        [button addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabbarView addSubview:button];
        [mutableItems addObject:button];
    }
    self.items = [mutableItems copy];
}

- (void)configViewControllers {
    //viewController
    //PageDefault *vc1 = [[PageDefault alloc] init];
    PageDefault *vc2 = [[PageDefault alloc] init];
    PageDefault *vc3 = [[PageDefault alloc] init];
    PageDefault *vc4 = [[PageDefault alloc] init];
//    HomePage *vc2 = [[HomePage alloc] init];
//    TeamPage *vc3 = [[TeamPage alloc] init];
//    MyPage *vc4 = [[MyPage alloc] init];
    
    //[self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self addChildViewController:vc4];
    
    self.viewControllers = @[
        //vc1,
        vc2,
        vc3,
        vc4];
    
    //view
    //vc1.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - Tabbar_Height - Control_Bar_Height);
    vc2.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - Tabbar_Height - Control_Bar_Height);
    vc3.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - Tabbar_Height - Control_Bar_Height);
    vc4.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - Tabbar_Height - Control_Bar_Height);
    
    //[self.view addSubview:vc1.view];
    [self.view addSubview:vc2.view];
    [self.view addSubview:vc3.view];
    [self.view addSubview:vc4.view];
    
    self.contentViews = @[
        //vc1.view,
        vc2.view,
        vc3.view,
        vc4.view];
}

- (void)visableAtFirst {
    for (NSInteger i = 0; i < self.items.count; i++) {
        UIButton *button = self.items[i];
        UIImageView *imageView = button.subviews[0];
        UILabel *itemLabel = button.subviews[1];
        
        if (i == 0) {
            itemLabel.textColor = DeepColor;
            imageView.image = _hilightImages[0];
        } else {
            itemLabel.textColor = LightColor;
            imageView.image = _normalImages[i];
        }
    }
    
    for (NSInteger i = 0; i < self.contentViews.count; i++) {
        UIView *view = self.contentViews[i];
        if (i == 0) {
            view.hidden = NO;
        } else {
            view.hidden = YES;
        }
    }
}

- (void)itemClicked: (UIButton *)sender {
    NSInteger index = 0;
    
    UIButton *theButton;
    for (NSInteger i = 0; i < self.items.count; i++) {
        UIButton *button = self.items[i];
        if (button == sender) {
            theButton = button;
            index = i;
            break;
        }
    }
    
    //item
    for (NSInteger i = 0; i < self.items.count; i++) {
        UIButton *button = self.items[i];
        UIImageView *imageView = button.subviews[0];
        UILabel *itemLabel = button.subviews[1];
        
        if (button == theButton) {
            //高亮状态
            itemLabel.textColor = DeepColor;
            imageView.image = _hilightImages[i];
        } else {
            //普通状态
            itemLabel.textColor = LightColor;
            imageView.image = _normalImages[i];
        }
    }
    
    //view
    for (NSInteger i = 0; i < self.contentViews.count; i++) {
        if (i == index) {
            self.contentViews[i].hidden = NO;
        } else {
            self.contentViews[i].hidden = YES;
        }
    }
}

#pragma mark - lazyLoad
- (UIView *)tabbarView {
    if (_tabbarView) {
        return _tabbarView;
    }
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height - Tabbar_Height - Control_Bar_Height, Screen_Width, Tabbar_Height + Control_Bar_Height)];
    _tabbarView.backgroundColor = [UIColor whiteColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0.5)];
    line.backgroundColor = COLOR(@"cccccc");
    [_tabbarView addSubview:line];
    return _tabbarView;
}

@end

//
//  WebPage.m
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "WebPage.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface WebPage ()<WKScriptMessageHandler, WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkwebview;
@property (nonatomic, strong) WKWebViewConfiguration *wkwebViewConfiguration;
@property (nonatomic, strong) NSMutableArray<JsFuncModel *> *jsFuncArr;

@end

@implementation WebPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _jsFuncArr = [NSMutableArray new];
    
    [self customUI];
    [self initListner];
    [self initData];
    
}

- (void)clearJs {
    for (JsFuncModel *obj in _jsFuncArr) {
        [_wkwebview.configuration.userContentController removeScriptMessageHandlerForName:obj.name];
    }
}

- (void)customUI {
    _wkwebViewConfiguration = [[WKWebViewConfiguration alloc] init];
    _wkwebViewConfiguration.preferences = [[WKPreferences alloc] init];
    _wkwebViewConfiguration.preferences.javaScriptEnabled = YES;
    _wkwebViewConfiguration.userContentController = [[WKUserContentController alloc] init];
    
    _wkwebview = [[WKWebView alloc] initWithFrame:CGRectMake(0, Status_Nav_Bar_Height, Screen_Width, Screen_Height - Status_Nav_Bar_Height) configuration:_wkwebViewConfiguration];
    
    [self.view addSubview:_wkwebview];
    _wkwebview.navigationDelegate = self;
}

- (void)initListner {
    
}

- (void)initData {
    
}


- (void)loadH5: (NSString *)name {
    [_wkwebview loadRequest:
     [
      [NSURLRequest alloc] initWithURL:
      
      [
       [NSURL alloc] initFileURLWithPath:
       
       [
        [NSBundle mainBundle] pathForResource:name ofType:@"html" inDirectory:@"h5"
                                          ]
       ]
      
      ]
     ];
}

- (void)addJsFunc:(NSString *)name callback:(Callback)callback {
    [_wkwebViewConfiguration.userContentController addScriptMessageHandler:self name:name];
    [_jsFuncArr addObject: [[JsFuncModel alloc] initWithName:name callback:callback]];
}

- (void)addJsObj:(NSString *)key value:(NSString *)value {
    [_wkwebview evaluateJavaScript:[NSString stringWithFormat:@"vm.%@ = %@", key, value] completionHandler:nil];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

//MARK: 处理JS交互

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"JSfunc name: %@", message.name);
    NSLog(@"JSfunc body: %@", message.body);
    
    for (JsFuncModel *model in _jsFuncArr) {
        if (model.name == message.name) {
            model.callback(message.body);
            break;
        }
    }
}

@end

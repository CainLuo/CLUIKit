//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLWebViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLWebViewController.h"

@interface CLWebViewController ()

@property (nonatomic, strong, readwrite) WKWebView *cl_webView;

@end

@implementation CLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self cl_addConstraintsWithSuperView];
}

- (void)cl_setWebViewUIDelegate:(id<WKUIDelegate>)UIDelegate
             navigationDelegate:(id<WKNavigationDelegate>)navigationDelegate {
    
    self.cl_webView.UIDelegate         = UIDelegate;
    self.cl_webView.navigationDelegate = navigationDelegate;
}

- (WKWebView *)cl_webView {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_webView);
    
    _cl_webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    return _cl_webView;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self.view addSubview:self.cl_webView];
}

@end
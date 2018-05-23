//
//  EXWebViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXWebViewController.h"
#import "EXWebViewNavigationDelegate.h"
#import "EXWebViewUIDelegate.h"
#import "EXWebViewViewModel.h"

@interface EXWebViewController ()

@property (nonatomic, strong) EXWebViewNavigationDelegate *ex_webViewNavigationDelegate;
@property (nonatomic, strong) EXWebViewUIDelegate         *ex_webViewUIDelegate;
@property (nonatomic, strong) EXWebViewViewModel          *ex_webViewViewModel;

@end

@implementation EXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *ex_requestURL = [NSURL URLWithString:@"https://www.baidu.com"];
    
    [self.cl_webView loadRequest:[NSURLRequest requestWithURL:ex_requestURL]];
    
    [self cl_setWebViewUIDelegate:self.ex_webViewUIDelegate
               navigationDelegate:self.ex_webViewNavigationDelegate];
}

- (EXWebViewNavigationDelegate *)ex_webViewNavigationDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_webViewNavigationDelegate);
    
    _ex_webViewNavigationDelegate = [[EXWebViewNavigationDelegate alloc] initWebViewNavigationDelegateWithViewModel:self.ex_webViewViewModel];
    
    return _ex_webViewNavigationDelegate;
}

- (EXWebViewUIDelegate *)ex_webViewUIDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_webViewUIDelegate);
    
    _ex_webViewUIDelegate = [[EXWebViewUIDelegate alloc] initWebViewUIDelegateWithViewModel:self.ex_webViewViewModel];
    
    return _ex_webViewUIDelegate;
}

- (EXWebViewViewModel *)ex_webViewViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_webViewViewModel);
    
    _ex_webViewViewModel = [[EXWebViewViewModel alloc] initWebViewModelWithController:self];
    
    return _ex_webViewViewModel;
}

@end

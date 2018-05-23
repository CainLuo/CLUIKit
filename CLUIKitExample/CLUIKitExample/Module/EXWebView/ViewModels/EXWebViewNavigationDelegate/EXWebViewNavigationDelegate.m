//
//  EXWebViewNavigationDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXWebViewNavigationDelegate.h"

@implementation EXWebViewNavigationDelegate

- (void)webView:(WKWebView *)webView
didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"WkWebView开始加载");
}

- (void)webView:(WKWebView *)webView
didFinishNavigation:(WKNavigation *)navigation {
    
    NSLog(@"WkWebView加载完成");
}

@end

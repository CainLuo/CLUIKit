//
//  EXWebViewUIDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXWebViewUIDelegate.h"

@implementation EXWebViewUIDelegate

- (void)webView:(WKWebView *)webView
runJavaScriptAlertPanelWithMessage:(NSString *)message
initiatedByFrame:(WKFrameInfo *)frame
completionHandler:(void (^)(void))completionHandler {
    
    UIAlertAction *ex_alertAction = [UIAlertAction actionWithTitle:@"好的"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
        
                                                               completionHandler();
                                                           }];
    
    [self.cl_viewModel.cl_webViewController cl_showAlertViewControllerWithTitle:@"温馨提示"
                                                                        message:message
                                                                        actions:@[ex_alertAction]
                                                                 preferredStyle:UIAlertControllerStyleAlert];
}

@end

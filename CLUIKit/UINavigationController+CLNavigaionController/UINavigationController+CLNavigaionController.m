//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UINavigationController+CLNavigaionController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/9.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UINavigationController+CLNavigaionController.h"

@implementation UINavigationController (CLNavigaionController)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar
        shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL cl_shouldPop = YES;
    
    UIViewController *cl_viewController = [self topViewController];
    
    if([cl_viewController respondsToSelector:@selector(cl_navigationShouldPopOnBackButton)]) {
        
        cl_shouldPop = [cl_viewController cl_navigationShouldPopOnBackButton];
    }
    
    if(cl_shouldPop) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
        
    } else {
        
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *cl_subview in [navigationBar subviews]) {
            
            if(0.f < cl_subview.alpha && cl_subview.alpha < 1.0) {
                
                [UIView animateWithDuration:0.25
                                 animations:^{
                    
                                     cl_subview.alpha = 1.0f;
                                 }];
            }
        }
    }
    
    return NO;
}

@end

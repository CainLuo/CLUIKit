//
//  EXRootTransitioningDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/6/26.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootTransitioningDelegate.h"

@implementation EXRootTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    
    CLPresentationController *cl_presentationController = [[CLPresentationController alloc] initWithPresentedViewController:presented
                                                                                                   presentingViewController:presenting];
    
    return cl_presentationController;
}

@end

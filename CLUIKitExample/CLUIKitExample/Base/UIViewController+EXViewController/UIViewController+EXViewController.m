//
//  UIViewController+EXViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIViewController+EXViewController.h"

@implementation UIViewController (EXViewController)

- (void)dealloc {
    NSLog(@"释放了: %@", NSStringFromClass(self.class));
}

@end

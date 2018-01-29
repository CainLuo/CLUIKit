//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLNavigationController.m
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLNavigationController.h"

@interface CLNavigationController ()

@end

@implementation CLNavigationController

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController
                     animated:animated];
}

@end

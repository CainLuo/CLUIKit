//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLApplication.m
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "CLApplication.h"

@implementation CLApplication

- (void)cl_showNetworkActivityIndicatorVisible {
    self.networkActivityIndicatorVisible = YES;
}

- (void)cl_dismissNetworkActivityIndicatorVisible {
    self.networkActivityIndicatorVisible = NO;
}

- (void)cl_setNetworkActivityIndicatorVisibleWithBOOL:(BOOL)bools {
    self.networkActivityIndicatorVisible = bools;
}

- (UIWindow *)cl_getKeyWindow {
    return self.keyWindow;
}

@end

//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIScreen+CLScreen.m
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIScreen+CLScreen.h"
#import "UIDevice+CLDevice.h"

@implementation UIScreen (CLScreen)

#pragma mark - 获取屏幕宽度
+ (CGFloat)cl_getScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

#pragma mark - 获取屏幕高度
+ (CGFloat)cl_getScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

#pragma mark - 适配iPad, iPhone, iPod Touch
+ (CGFloat)cl_fitScreen:(CGFloat)value {
    
    if ([[UIDevice cl_getDeviceModelType] isEqualToString:@"iPad"]) {
        return ceilf([self cl_getScreenWidth] / (1535.0f / 2)  * ((value) / 2) * 2) / 2.0f;
    } else {
        return ceilf([self cl_getScreenWidth] / (750.0f / 2)  * ((value) / 2) * 2) / 2.0f;
    }
}

#pragma mark - 获取状态栏的高度
+ (CGFloat)cl_getStatusBarHeight {
    
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

#pragma mark - 获取导航栏的高度
+ (CGFloat)cl_getNavigationBarHeight {
        
    return 44.0f;
}

@end

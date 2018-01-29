//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIScreen+CLScreen.h
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (CLScreen)

/**
 *  获取屏幕宽度
 *
 *  @return 返回屏幕宽度
 */
+ (CGFloat)cl_getScreenWidth;

/**
 *  获取屏幕高度
 *
 *  @return 返回屏幕高度
 */
+ (CGFloat)cl_getScreenHeight;

/**
 *  iPhone是以 (iPhone 6)750x1334 为基准, iPad是以 (iPad Air)2048×1536 为基准
 *
 *  @param value UI原始值
 *
 *  @return 返回适配后的数值
 */
+ (CGFloat)cl_fitScreen:(CGFloat)value;

/**
 *  获取状态栏的高度
 *
 *  @return 返回状态栏的高度
 */
+ (CGFloat)cl_getStatusBarHeight;

/**
 *  获取导航栏的高度
 *
 *  @return 返回导航栏的高度
 */
+ (CGFloat)cl_getNavigationBarHeight;

@end

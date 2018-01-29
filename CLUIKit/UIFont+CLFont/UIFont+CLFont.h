//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIFont+CLFont.h
//
//  Created by Cain Luo on 2017/12/18.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (CLFont)

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)cl_fitBoldSysteFontOfSize:(CGFloat)fontSize;
+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);
+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);

@end

//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIColor+CLColor.m
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIColor+CLColor.h"

@implementation UIColor (CLColor)

#pragma mark - 随机颜色
+ (UIColor *)cl_getARC4RandomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0
                           green:arc4random_uniform(256)/255.0
                            blue:arc4random_uniform(256)/255.0
                           alpha:1.0];
}

#pragma mark - 十六进制颜色值
+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue
                    alpha:(CGFloat)alphaValue {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue {
    return [UIColor cl_colorWithHex:hexValue alpha:1.0];
}

#pragma mark - 常规三原色值
+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:alpha];
}

+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue {
    
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:1.0f];
}

#pragma mark - 字符串转颜色值
+ (UIColor *)cl_colorWithHexString:(NSString *)hexString {
    
    return [self cl_getColorWithHexString:hexString
                                    alpha:1.0f];
}


+ (UIColor *)cl_colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alphaValue {
    
    return [self cl_getColorWithHexString:hexString
                                    alpha:alphaValue];
}

+ (UIColor *)cl_getColorWithHexString:(NSString *)hexString
                                alpha:(CGFloat)alphaValue {
    
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([colorString length] < 6) {
        
        return [UIColor blackColor];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        
        colorString = [colorString substringFromIndex:1];
    }
    
    if ([colorString length] != 6) {
        
        return [UIColor blackColor];
    }
    
    NSRange range;
    
    range.location = 0;
    range.length = 2;
    
    NSString *redString = [colorString substringWithRange:range];
    
    range.location = 2;
    
    NSString *greenString = [colorString substringWithRange:range];
    
    range.location = 4;
    
    NSString *blueString = [colorString substringWithRange:range];
    
    unsigned int red, green, blue;
    
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [UIColor colorWithRed:((float) red / 255.0f)
                           green:((float) green / 255.0f)
                            blue:((float) blue / 255.0f)
                           alpha:1.0f];
}

@end

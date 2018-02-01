//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIButton+CLButton.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIButton (CLButton)

/**
 设置Button的点击区域
 */
@property (nonatomic, assign) UIEdgeInsets cl_clickAreaEdgeInsets;

/**
 Button倒计时方法

 @param time 倒计时的时间
 */
- (void)cl_startButtonWithTime:(NSInteger)time;

/**
 Button倒计时方法

 @param time 倒计时的时间
 @param disableImage 倒计时时的背景图
 */
- (void)cl_startButtonWithTime:(NSInteger)time
                   normalImage:(UIImage *)normalImage
                  disableImage:(UIImage *)disableImage;

/**
 Button倒计时方法

 @param time 倒计时的时间
 @param title 初始化的标题
 @param suffixTitle 时间的尾缀, 比如: 10s
 @param normalColor 正常按钮的颜色
 @param timingColor 正在倒计时的颜色
 */
- (void)cl_startButtonWithTime:(NSInteger)time
                         title:(NSString *)title
                   suffixTitle:(NSString *)suffixTitle
                   normalColor:(UIColor *)normalColor
                    timingColor:(UIColor *)timingColor;

@end
NS_ASSUME_NONNULL_END

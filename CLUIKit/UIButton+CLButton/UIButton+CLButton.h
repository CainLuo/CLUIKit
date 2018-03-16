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

/**
 UIButton倒计时的状态

 - CLButtonStarStyleBegin: 开始倒计时
 - CLButtonStarStyleFinish: 倒计时完成
 */
typedef NS_ENUM(NSInteger, CLButtonStarStyle) {
    CLButtonStarStyleBegin = 0,
    CLButtonStarStyleFinish
};

/**
 UIButton倒计时的回调

 @param cl_starButton UIButton
 @param cl_buttonStarStyle CLButtonStarStyle
 @param time NSInteger
 */
typedef void(^CLButtonStar)(UIButton *cl_starButton, CLButtonStarStyle cl_buttonStarStyle, NSInteger time);

typedef void (^CLButtonAction)(UIButton *sender);

@interface UIButton (CLButton)

/**
 设置Button的点击区域
 */
@property (nonatomic, assign) UIEdgeInsets cl_clickAreaEdgeInsets;

#pragma mark - 倒计时方法
/**
 倒计时方法

 @param time 倒计时时间
 @param complete 倒计时的回调
 */
- (void)cl_starButtonWithTime:(NSInteger)time
                     complete:(CLButtonStar)complete;

#pragma mark - 添加UIButton点击方法
/**
 给UIButton添加一个Action Block

 @param complete CLButtonAction
 */
- (void)cl_addButtonActionComplete:(CLButtonAction)complete;

#pragma mark - 用UIActivityIndicatorView代替文字
/**
 显示UIActivityIndicatorView
 */
- (void)cl_showActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style;

/**
 隐藏UIActivityIndicatorView
 */
- (void)cl_hideActivityIndicatorView;

@end


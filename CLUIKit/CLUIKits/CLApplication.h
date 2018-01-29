//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLApplication.h
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLApplication : UIApplication

/**
 打开网络加载提示
 */
- (void)cl_showNetworkActivityIndicatorVisible;

/**
 关闭网络加载提示
 */
- (void)cl_dismissNetworkActivityIndicatorVisible;

/**
 设置网络加载提示

 @param bools YES为打开, NO为关闭
 */
- (void)cl_setNetworkActivityIndicatorVisibleWithBOOL:(BOOL)bools;

/**
 获取Key Window

 @return UIWindow
 */
- (UIWindow *)cl_getKeyWindow;

@end

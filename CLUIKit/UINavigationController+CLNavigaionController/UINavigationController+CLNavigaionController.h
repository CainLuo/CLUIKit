//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UINavigationController+CLNavigaionController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/9.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLNavigationControllerBackItemProtocol <NSObject>
@optional

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)cl_navigationShouldPopOnBackButton;

@end

@interface UINavigationController (CLNavigaionController)

@end

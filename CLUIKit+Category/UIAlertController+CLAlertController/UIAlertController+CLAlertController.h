//
//  UIAlertController+CLAlertController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2019/1/22.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+CLViewController.h"

@interface UIAlertController (CLAlertController)

/**
 添加UIAlertActionStyleCancel的UIAlertAction

 @param actionTitle NSString
 @param complete CLAlertControlAction
 */
- (void)cl_addCancelAlertActionWithActionTitle:(NSString *)actionTitle
                                      complete:(CLAlertControlAction)complete;

/**
 快速添加UIAlertController的UIAlertAction

 @param actionTitles NSArray<NSString *> *，数据中的元素至少是非空值
 @param complete CLAlertControlAction
 */
- (void)cl_addAlertActionWithActionTitles:(NSArray<NSString *> *)actionTitles
                                 complete:(CLAlertControlAction)complete;

/**
 UIAlertControllerStyleAlert样式的UIAlertController

 @param title NSString
 @param message NSString
 @param actionTitle NSString
 @return UIAlertController
 */
+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           actionTitle:(NSString *)actionTitle;

/**
 UIAlertControllerStyleAlert样式的UIAlertController

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param complete CLAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(CLAlertControlAction)complete;

/**
 UIAlertControllerStyleActionSheet样式的UIAlertController

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param complete CLAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)cl_showSheetControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(CLAlertControlAction)complete;

/**
 可自定义的UIAlertController API

 @param title NSString
 @param message NSString
 @param cancelTitle NSString
 @param actionTitles NSArray<NSString *> *
 @param preferredStyle UIAlertControllerStyle
 @param complete CLAlertControlAction
 @return UIAlertController
 */
+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                              complete:(CLAlertControlAction)complete;

@end

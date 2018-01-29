//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIViewController+CLViewController.m
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIViewController+CLViewController.h"
#import <objc/runtime.h>

static void *AlertControllerKey = &AlertControllerKey;

@implementation UIViewController (CLViewController)

- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools {
    self.navigationController.navigationBar.translucent = bools;
}

- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools {
    self.tabBarController.tabBar.translucent = bools;
}

#pragma mark - AlertController
- (void)setCl_alertController:(UIAlertController *)cl_alertController {
    
    objc_setAssociatedObject(self, AlertControllerKey, cl_alertController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAlertController *)cl_alertController {
    
    return objc_getAssociatedObject(self, AlertControllerKey);
}

- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title {
    
    NSMutableString *cl_tellPhoneNumber = [[NSMutableString alloc]initWithFormat:@"tel:%@", phoneNumber];
    
    UIAlertAction *cl_cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction *action) {}];
    
    UIAlertAction *cl_otherAction = [UIAlertAction actionWithTitle:@"呼叫"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                               
                                                               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:cl_tellPhoneNumber]];
                                                           }];
    
    [self cl_showAlertViewControllerWithTitle:title
                                      message:[NSString stringWithFormat:@"%@%@", message, phoneNumber]
                                      actions:@[cl_cancelAction, cl_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle{
    
    UIAlertAction *cl_otherAction = [UIAlertAction actionWithTitle:buttonTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                           }];
    
    [self cl_showAlertViewControllerWithTitle:title
                                      message:message
                                      actions:@[cl_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *) actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    self.cl_alertController = [UIAlertController alertControllerWithTitle:title
                                                                  message:message
                                                           preferredStyle:preferredStyle];
    
    if (actions) {
        
        for (UIAlertAction *cl_alertAction in actions) {
            
            [self.cl_alertController addAction:cl_alertAction];
        }
    }
    
    [self presentViewController:self.cl_alertController
                       animated:YES
                     completion:nil];
}

- (void)cl_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                    handler:(void (^ __nullable)(UIAlertAction *action))handler {
    
    self.cl_alertController = [UIAlertController alertControllerWithTitle:title
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleActionSheet];

    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *fs_sheetAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (handler) {
                                                                       
                                                                       handler(action);
                                                                   }
                                                               }];
        
        [self.cl_alertController addAction:fs_sheetAction];
    }];
    
    UIAlertAction *fs_cancelAlertAction = [UIAlertAction actionWithTitle:@"取消"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];

    [self.cl_alertController addAction:fs_cancelAlertAction];
    
    [self presentViewController:self.cl_alertController
                       animated:YES
                     completion:nil];
}

@end

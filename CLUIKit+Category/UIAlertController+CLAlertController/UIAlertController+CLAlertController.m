
//
//  UIAlertController+CLAlertController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2019/1/22.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

#import "UIAlertController+CLAlertController.h"

@implementation UIAlertController (CLAlertController)

- (void)cl_addCancelAlertActionWithActionTitle:(NSString *)actionTitle
                                      complete:(CLAlertControlAction)complete {
    
    UIAlertAction *cl_alertAction = [UIAlertAction actionWithTitle:actionTitle
                                                             style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               
                                                               if (complete) {
                                                                   complete(action, -1);
                                                               }
                                                           }];
    
    [self addAction:cl_alertAction];
}

- (void)cl_addAlertActionWithActionTitles:(NSArray<NSString *> *)actionTitles
                                 complete:(CLAlertControlAction)complete {

    [actionTitles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (title.length) {
            
            UIAlertAction *cl_alertAction = [UIAlertAction actionWithTitle:title
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                                       
                                                                       if (complete) {
                                                                           complete(action, idx);
                                                                       }
                                                                   }];
            
            [self addAction:cl_alertAction];
        }
    }];
}

+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           actionTitle:(NSString *)actionTitle {
    
    return [self cl_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:nil
                                    actionTitles:@[actionTitle]
                                  preferredStyle:UIAlertControllerStyleAlert
                                        complete:nil];
}

+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(CLAlertControlAction)complete {
    
    return [self cl_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:cancelTitle
                                    actionTitles:actionTitles
                                  preferredStyle:UIAlertControllerStyleAlert
                                        complete:complete];
}

+ (UIAlertController *)cl_showSheetControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                              complete:(CLAlertControlAction)complete {
    
    return [self cl_showAlertControllerWithTitle:title
                                         message:message
                                     cancelTitle:cancelTitle
                                    actionTitles:actionTitles
                                  preferredStyle:UIAlertControllerStyleActionSheet
                                        complete:complete];
}

+ (UIAlertController *)cl_showAlertControllerWithTitle:(NSString *)title
                                               message:(NSString *)message
                                           cancelTitle:(NSString *)cancelTitle
                                          actionTitles:(NSArray<NSString *> *)actionTitles
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                              complete:(CLAlertControlAction)complete {
    
    UIAlertController *cl_alertController = [self alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:preferredStyle];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *cl_alertAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (complete) {
                                                                       
                                                                       complete(action, idx);
                                                                   }
                                                               }];
        
        [cl_alertController addAction:cl_alertAction];
    }];
    
    if (cancelTitle.length) {
    
        UIAlertAction *cl_cancelAlertAction = [UIAlertAction actionWithTitle:cancelTitle
                                                                       style:UIAlertActionStyleCancel
                                                                     handler:nil];
        
        [cl_alertController addAction:cl_cancelAlertAction];
    }
    
    return cl_alertController;
}


@end

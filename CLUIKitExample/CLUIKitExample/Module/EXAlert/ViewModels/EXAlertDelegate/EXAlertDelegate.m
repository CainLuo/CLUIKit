//
//  EXAlertDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAlertDelegate.h"
#import "EXAlertBaseModel.h"

@implementation EXAlertDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    EXAlertBaseModel *ex_aertBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];

    switch (ex_aertBaseModel.alertType) {
        case EXAlertTypePhone:
            
            [self ex_callPhoneNumber];
            break;
        case EXAlertTypeAlert:
            
            [self ex_alert];
            break;
            
        case EXAlertTypeAlertSheet:
            
            [self ex_alertActionSheet];
            break;
        case EXAlertTypeCustom:
            
            [self ex_customAlertController];
            break;
        case EXAlertTypeCustomTitles:
            
            [self ex_customAlertTitlesController];
            break;
        default:
            break;
    }
}

- (void)ex_callPhoneNumber {
    
    [self.cl_viewModel.cl_tableViewController cl_callPhoneWithPhoneNumber:@"13800138000"
                                                                  message:@"是否要拨打电话"
                                                                   titile:@"温馨提示"];
}

- (void)ex_alert {
    
    [self.cl_viewModel.cl_tableViewController cl_showAlertViewControllerWithTitle:@"温馨提示"
                                                                          message:@"这是Message"
                                                                      buttonTitle:@"好的"];
}

- (void)ex_alertActionSheet {
    
    
    
    [self.cl_viewModel.cl_tableViewController cl_showSheetViewControllerWithTitle:@"温馨提示"
                                                                          message:@"这是Message"
                                                                     actionTitles:@[@"标题一", @"标题二"]
                                                                          complete:^(UIAlertAction *action, NSUInteger index) {
                                                                              
                                                                              NSLog(@"点击了第%lu个, 标题为: %@", (unsigned long)index, action.title);
                                                                          }];
}

- (void)ex_customAlertController {
    
    UIAlertAction *cl_cancel = [UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * _Nonnull action) {
        
                                                          NSLog(@"点击了取消");
                                                      }];
    
    UIAlertAction *cl_define = [UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          NSLog(@"点击了确定");
                                                      }];
    
    [self.cl_viewModel.cl_tableViewController cl_showAlertViewControllerWithTitle:@"温馨提示"
                                                                          message:@"这是Message"
                                                                          actions:@[cl_cancel, cl_define]
                                                                   preferredStyle:UIAlertControllerStyleAlert];
}

- (void)ex_customAlertTitlesController {
    
    [self.cl_viewModel.cl_tableViewController cl_showAlertViewControllerWithTitle:@"温馨提示"
                                                                          message:@"这是Message"
                                                                     actionTitles:@[@"取消", @"好的"]
                                                                         complete:^(UIAlertAction *action, NSUInteger index) {
        
                                                                             NSLog(@"点击了第%lu个, 标题为: %@", (unsigned long)index, action.title);
                                                                         }];
}

@end

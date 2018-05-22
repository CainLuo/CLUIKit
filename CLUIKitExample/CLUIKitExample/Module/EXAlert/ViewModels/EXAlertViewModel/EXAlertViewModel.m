//
//  EXAlertViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAlertViewModel.h"
#import "EXAlertBaseModel.h"

@implementation EXAlertViewModel

- (void)cl_tableViewHTTPRequest {
    
    [self.cl_dataSource removeAllObjects];
    
    NSArray *ex_dataSourceArray = @[@{@"title":@"CLAlertTypePhone",
                                      @"alertType":@(EXAlertTypePhone)},
                                    @{@"title":@"CLAlertTypeAlert",
                                      @"alertType":@(EXAlertTypeAlert)},
                                    @{@"title":@"CLAlertTypeAlertSheet",
                                      @"alertType":@(EXAlertTypeAlertSheet)},
                                    @{@"title":@"CLAlertTypeCustom",
                                      @"alertType":@(EXAlertTypeCustom)},
                                    @{@"title":@"CLAlertTypeCustomTitles",
                                      @"alertType":@(EXAlertTypeCustomTitles)}];
    
    [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[EXAlertBaseModel class]
                                                                       json:ex_dataSourceArray]];
    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];
    [self.cl_tableViewController cl_pullUpEndRefresh];
    
    [self cl_showTableViewSeparatorLine];
}

@end

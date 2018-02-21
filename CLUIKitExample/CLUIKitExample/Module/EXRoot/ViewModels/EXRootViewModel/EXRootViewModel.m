//
//  EXRootViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootViewModel.h"
#import "EXRootBaseModel.h"

@implementation EXRootViewModel

- (void)cl_tableViewHTTPRequest {
    
    [self.cl_dataSource removeAllObjects];

    NSArray *ex_dataSourceArray = @[@{@"title":@"EXAlertController",
                                      @"controller":@"EXAlertController"},
                                    @{@"title":@"EXButtonController",
                                      @"controller":@"EXButtonController"},
                                    @{@"title":@"EXCollectionViewController",
                                      @"controller":@"EXCollectionViewController"},
                                    @{@"title":@"EXTableViewController",
                                      @"controller":@"EXTableViewController"},
                                    @{@"title":@"EXColorController",
                                      @"controller":@"EXColorController"},
                                    @{@"title":@"EXImageController",
                                      @"controller":@"EXImageController"},
                                    @{@"title":@"EXScreenController",
                                      @"controller":@"EXScreenController"},
                                    @{@"title":@"EXDeviceController",
                                      @"controller":@"EXDeviceController"},
                                    @{@"title":@"EXFontController",
                                      @"controller":@"EXFontController"},
                                    @{@"title":@"EXTextFieldController",
                                      @"controller":@"EXTextFieldController"},
                                    @{@"title":@"EXScanQRCodeController",
                                      @"controller":@"EXScanQRCodeController"}];
    
    [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[EXRootBaseModel class]
                                                                       json:ex_dataSourceArray]];

    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];
    
    [self cl_configTableViewWithDataSource];
}

@end

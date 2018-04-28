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
                                    @{@"title":@"EXApplicationController",
                                      @"controller":@"EXApplicationController"},
                                    @{@"title":@"EXBarButtonItemController",
                                      @"controller":@"EXBarButtonItemController"},
                                    @{@"title":@"EXButtonController",
                                      @"controller":@"EXButtonController"},
                                    @{@"title":@"EXCollectionViewController",
                                      @"controller":@"EXCollectionViewController"},
                                    @{@"title":@"EXColorController",
                                      @"controller":@"EXColorController"},
                                    @{@"title":@"EXDeviceController",
                                      @"controller":@"EXDeviceController"},
                                    @{@"title":@"EXFontController",
                                      @"controller":@"EXFontController"},
                                    @{@"title":@"EXImageController",
                                      @"controller":@"EXImageController"},
                                    @{@"title":@"EXScanQRCodeController",
                                      @"controller":@"EXScanQRCodeController"},
                                    @{@"title":@"EXScreenController",
                                      @"controller":@"EXScreenController"},
                                    @{@"title":@"EXScrollViewController",
                                      @"controller":@"EXScrollViewController"},
                                    @{@"title":@"EXTableViewController",
                                      @"controller":@"EXTableViewController"},
                                    @{@"title":@"EXTextFieldController",
                                      @"controller":@"EXTextFieldController"}];
    
    [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[EXRootBaseModel class]
                                                                       json:ex_dataSourceArray]];

    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_endTableViewRefreshWithType:CLTableViewRefreshTypeDropDown];
    
    [self cl_showTableViewSeparatorLine];
}

@end

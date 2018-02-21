//
//  EXFontViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXFontViewModel.h"
#import "EXFontBaseModel.h"

@implementation EXFontViewModel

- (void)cl_tableViewHTTPRequest {
    
    [self.cl_dataSource removeAllObjects];
    
    NSArray *ex_dataSourceArray = @[@{@"title":@"CLFont Fit System Of Size",
                                      @"font":[UIFont cl_fitSystemFontOfSize:20]},
                                    @{@"title":@"UIFont System Of Size",
                                      @"font":[UIFont systemFontOfSize:20]},
                                    @{@"title":@"CLFont Fit Bold System Of Size",
                                      @"font":[UIFont cl_fitBoldSystemFontOfSize:20]},
                                    @{@"title":@"UIFont Bold System Of Size",
                                      @"font":[UIFont boldSystemFontOfSize:20]},
                                    @{@"title":@"CLFont Fit Italic System Of Size",
                                      @"font":[UIFont cl_fitItalicSystemFontOfSize:20]},
                                    @{@"title":@"UIFont Italic System Of Size",
                                      @"font":[UIFont italicSystemFontOfSize:20]},
                                    @{@"title":@"CLFont Fit System Of Size Weight",
                                      @"font":[UIFont cl_fitSystemFontOfSize:20 weight:100]},
                                    @{@"title":@"CLFont Digit System Of Size Weight",
                                      @"font":[UIFont cl_fitMonospacedDigitSystemFontOfSize:20 weight:100]}];
        
    [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[EXFontBaseModel class]
                                                                       json:ex_dataSourceArray]];
    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];
    [self.cl_tableViewController cl_pullUpEndRefresh];
    
    [self cl_configTableViewWithDataSource];
}

@end

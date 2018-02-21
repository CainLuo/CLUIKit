//
//  EXTableViewViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTableViewViewModel.h"

@implementation EXTableViewViewModel

- (void)cl_tableViewHTTPRequest {
    
    if (self.cl_dataSource.count) {
        
        [self.cl_dataSource removeAllObjects];
        
        [self.cl_tableViewController.cl_tableView cl_reloadData];

        [self.cl_tableViewController cl_dropDownEndRefresh];
        [self.cl_tableViewController cl_pullUpEndRefresh];
        
    } else {
     
        for (NSInteger i = 0; i < 10; i++) {
            
            [self.cl_dataSource addObject:[NSString stringWithFormat:@"第%ld条Cell", i]];
        }
        
        [self.cl_tableViewController.cl_tableView cl_reloadData];
        
        [self cl_configTableViewWithDataSource];
        
        [self.cl_tableViewController cl_dropDownEndRefresh];
        [self.cl_tableViewController cl_pullUpEndRefresh];
    }
}

@end

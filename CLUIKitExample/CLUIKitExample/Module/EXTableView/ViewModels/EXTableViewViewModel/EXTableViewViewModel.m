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
     
        for (NSInteger i = 0; i < 30; i++) {
            
            [self.cl_dataSource addObject:[NSString stringWithFormat:@"第%ld条Cell", (long)i]];
        }
        
        [self.cl_tableViewController.cl_tableView cl_reloadData];
        
        [self cl_showTableViewSeparatorLine];
        
        [self.cl_tableViewController cl_dropDownEndRefresh];
        [self.cl_tableViewController cl_pullUpEndRefresh];
        
        [self cl_performWithAfterSecond:1.0
                               complete:^{
           
//                                   [self.cl_tableViewController.cl_tableView cl_scrollToRow:20
//                                                                                    section:0
//                                                                             scrollPosition:UITableViewScrollPositionNone
//                                                                                   animated:YES];
                                   
                                   [self.cl_tableViewController.cl_tableView cl_scrollToIndexPath:nil
                                                                                   scrollPosition:UITableViewScrollPositionNone
                                                                                         animated:YES];
                               }];
    }
}

@end

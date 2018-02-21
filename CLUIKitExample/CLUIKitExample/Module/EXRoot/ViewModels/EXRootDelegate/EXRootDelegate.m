//
//  EXRootDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootDelegate.h"
#import "EXRootBaseModel.h"

@implementation EXRootDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    EXRootBaseModel *ex_rootBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];

    UIViewController *ex_controller = [[NSClassFromString(ex_rootBaseModel.controller) alloc] init];
    
    ex_controller.title = ex_rootBaseModel.title;
    
    [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:ex_controller
                                                                             animated:YES];
}

@end

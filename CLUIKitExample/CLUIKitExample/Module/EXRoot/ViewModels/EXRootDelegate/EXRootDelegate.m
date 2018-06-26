//
//  EXRootDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootDelegate.h"
#import "EXRootBaseModel.h"

#import "EXRootController.h"

@implementation EXRootDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    EXRootBaseModel *ex_rootBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];

    UIViewController *ex_controller = [[NSClassFromString(ex_rootBaseModel.controller) alloc] init];
    
    if ([ex_rootBaseModel.controller isEqualToString:@"EXPresentationController"]) {
        
        EXRootController *ex_rootController = (EXRootController *)self.cl_viewModel.cl_tableViewController;
        
        ex_controller.modalTransitionStyle      = UIModalPresentationCustom;
        ex_controller.transitioningDelegate     = ex_rootController.ex_rootTransitioningDelegate;
        ex_controller.cl_presentationViewHeight = 300;
        
        [self.cl_viewModel.cl_tableViewController presentViewController:ex_controller
                                                               animated:YES
                                                             completion:nil];
    } else {
        
        ex_controller.title = ex_rootBaseModel.title;
     
        [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:ex_controller
                                                                                 animated:YES];
    }
}

@end

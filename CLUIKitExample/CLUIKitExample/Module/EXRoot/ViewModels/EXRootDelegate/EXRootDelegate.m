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

#import "EXPresentationController.h"
#import "EXPickerController.h"

@implementation EXRootDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    EXRootBaseModel *ex_rootBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];

    if ([ex_rootBaseModel.controller isEqualToString:@"EXPresentationController"]) {
        
//        EXRootController *ex_rootController = (EXRootController *)self.cl_viewModel.cl_tableViewController;
//        EXPresentationController *ex_presentationController = [[EXPresentationController alloc] initViewControllerWithTransitioningDelegate:ex_rootController.ex_rootTransitioningDelegate];
//        EXPresentationController *ex_presentationController = [[EXPresentationController alloc] init];

//        ex_presentationController.transitioningDelegate     = ex_rootController.ex_rootTransitioningDelegate;
        
//        [self.cl_viewModel.cl_tableViewController presentViewController:ex_presentationController
//                                                               animated:YES
//                                                             completion:nil];
        
        EXPickerController *ex_pickerController = [[EXPickerController alloc] initPickerControllerWithHeight:244];

        [self.cl_viewModel.cl_tableViewController presentViewController:ex_pickerController
                                                               animated:YES
                                                             completion:nil];
        
    } else {
        
        UIViewController *ex_controller = [[NSClassFromString(ex_rootBaseModel.controller) alloc] init];

        ex_controller.title = ex_rootBaseModel.title;
     
        [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:ex_controller
                                                                                 animated:YES];
    }
}

@end

//
//  EXTableViewDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTableViewDelegate.h"

@implementation EXTableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath
//                             animated:YES];
    
    NSLog(@"点击了: %@", self.cl_viewModel.cl_dataSource[indexPath.row]);
    
    // 插入操作
//    [self.cl_viewModel.cl_dataSource addObject:@"123123"];
//
//    [tableView cl_insertRowWithIndexPath:indexPath
//                               animation:UITableViewRowAnimationAutomatic];
    
    // 刷新操作
//    [self.cl_viewModel.cl_dataSource replaceObjectAtIndex:indexPath.row
//                                               withObject:@"123123"];
//
//    [tableView cl_reloadRowWithIndexPath:indexPath
//                               animation:UITableViewRowAnimationAutomatic];

    // 删除操作
//    [self.cl_viewModel.cl_dataSource removeObjectAtIndex:indexPath.row];
//
//    [tableView cl_deleteRowWithIndexPath:indexPath
//                               animation:UITableViewRowAnimationAutomatic];
    
    
//    [tableView cl_resetSelectedRowsAnimated:YES];
//    [tableView cl_scrollViewToBottomWithAnimated:YES];
}

- (UIView *)cl_placeholderView {
    
    UIView *cl_placeholderView = [[UIView alloc] init];
    
    cl_placeholderView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return cl_placeholderView;
}

- (BOOL)cl_calculateTableViewHeaderViewFrame {
    
    return YES;
}

@end

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
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    NSLog(@"点击了: %@", self.cl_viewModel.cl_dataSource[indexPath.row]);
}

- (UIView *)cl_placeholderView {
    
    UIView *cl_placeholderView = [[UIView alloc] init];
    
    cl_placeholderView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return cl_placeholderView;
}

@end

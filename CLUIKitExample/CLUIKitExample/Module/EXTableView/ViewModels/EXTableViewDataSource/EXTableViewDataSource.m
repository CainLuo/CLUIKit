//
//  EXTableViewDataSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTableViewDataSource.h"

@implementation EXTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cl_tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cl_tableViewCell) {
        
        cl_tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"UITableViewCell"];
    }
    
    cl_tableViewCell.textLabel.text = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    cl_tableViewCell.contentView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return cl_tableViewCell;
}

@end

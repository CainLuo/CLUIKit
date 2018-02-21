//
//  EXRootDataSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootDataSource.h"
#import "EXRootBaseModel.h"

@implementation EXRootDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EXRootBaseModel *ex_rootBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    UITableViewCell *ex_tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!ex_tableViewCell) {
        
        ex_tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"UITableViewCell"];
    }
    
    ex_tableViewCell.textLabel.text = ex_rootBaseModel.title;
    
    return ex_tableViewCell;
}

@end

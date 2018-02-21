//
//  EXAlertDataSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAlertDataSource.h"
#import "EXAlertBaseModel.h"

@implementation EXAlertDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EXAlertBaseModel *ex_aertBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    UITableViewCell *ex_tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!ex_tableViewCell) {
        
        ex_tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"UITableViewCell"];
    }
    
    ex_tableViewCell.textLabel.text = ex_aertBaseModel.title;
    
    return ex_tableViewCell;
}

@end

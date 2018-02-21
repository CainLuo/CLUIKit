//
//  EXFontDateSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXFontDateSource.h"
#import "EXFontBaseModel.h"

@implementation EXFontDateSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EXFontBaseModel *ex_fontBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    UITableViewCell *ex_tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!ex_tableViewCell) {
        
        ex_tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"UITableViewCell"];
    }
    
    ex_tableViewCell.textLabel.text = ex_fontBaseModel.title;
    ex_tableViewCell.textLabel.font = ex_fontBaseModel.font;
    
    return ex_tableViewCell;
}

@end

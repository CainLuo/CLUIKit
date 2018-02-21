//
//  EXFontDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXFontDelegate.h"
#import "EXFontBaseModel.h"

@implementation EXFontDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    EXFontBaseModel *ex_fontBaseModel = self.cl_viewModel.cl_dataSource[indexPath.row];

    NSLog(@"点击了%@, Font为:%@", ex_fontBaseModel.title, ex_fontBaseModel.font);
}

@end

//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewBaseModel.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewController.h"

@interface CLTableViewViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *cl_dataSource;
@property (nonatomic, weak, readonly) CLTableViewController *cl_tableViewController;

- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController;

/**
 通过HTTP请求数据
 */
- (void)cl_tableViewHTTPRequest;

/**
 配置TableView每一条Cell所显示的分割线
 */
- (void)cl_configTableViewWithDataSource;

@end

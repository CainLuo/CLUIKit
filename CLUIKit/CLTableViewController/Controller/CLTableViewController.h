//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewController.h
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLTableViewController : CLViewController

@property (nonatomic, strong, null_resettable, readonly) UITableView *cl_tableView;

/**
 初始化CLTableViewController

 @param style UITableViewStyle, 默认是UITableViewStylePlain
 @return CLTableViewController
 */
- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style;

- (void)cl_removeRefresh;
- (void)cl_removeHeaderRefresh;
- (void)cl_removeFooterRefresh;

/**
 下拉刷新方法/上拉加载方法
 */
- (void)cl_dropDownRefresh;
- (void)cl_pullUpRefresh;

/**
 开始执行下拉操作/结束下拉操作
 */
- (void)cl_dropDownBeginRefresh;
- (void)cl_dropDownEndRefresh;

/**
 开始执行上拉操作/结束上拉操作
 */
- (void)cl_pullUpBeginRefresh;
- (void)cl_pullUpEndRefresh;

- (void)cl_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;
@end
NS_ASSUME_NONNULL_END

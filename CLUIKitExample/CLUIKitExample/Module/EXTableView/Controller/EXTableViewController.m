//
//  EXTableViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTableViewController.h"
#import "EXTableViewDelegate.h"
#import "EXTableViewDataSource.h"
#import "EXTableViewViewModel.h"

@interface EXTableViewController ()

@property (nonatomic, strong) EXTableViewDelegate   *ex_tableViewDelegate;
@property (nonatomic, strong) EXTableViewDataSource *ex_tableViewDataSource;
@property (nonatomic, strong) EXTableViewViewModel  *ex_tableViewViewModel;

@end

@implementation EXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setTableViewDelegate:self.ex_tableViewDelegate
                       dataSource:self.ex_tableViewDataSource];
    
    [self cl_dropDownRefresh];
    
    [self.cl_tableView cl_reloadData];
    
    NSLog(@"获取UINavigationBar的高度: %f\n", [self.navigationController cl_getNavigationBarHeight]);
    NSLog(@"获取UIStatusBar的高度: %f\n", [UIApplication cl_getStatusBarHeight]);
 }

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (void)cl_dropDownRefresh {
    
    [self.ex_tableViewViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
}

- (EXTableViewDelegate *)ex_tableViewDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_tableViewDelegate);
    
    _ex_tableViewDelegate = [[EXTableViewDelegate alloc] initTableViewDelegateWithViewModel:self.ex_tableViewViewModel];
    
    return _ex_tableViewDelegate;
}

- (EXTableViewViewModel *)ex_tableViewViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_tableViewViewModel);
    
    _ex_tableViewViewModel = [[EXTableViewViewModel alloc] initTableViewBaseModelWithController:self];
    
    return _ex_tableViewViewModel;
}

- (EXTableViewDataSource *)ex_tableViewDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_tableViewDataSource);
    
    _ex_tableViewDataSource = [[EXTableViewDataSource alloc] initTableViewDataSourceWithViewModel:self.ex_tableViewViewModel];
    
    return _ex_tableViewDataSource;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            
            (void)make.edges;
        }
    }];
}

@end

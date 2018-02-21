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
}

- (void)cl_dropDownRefresh {
    
    [self.ex_tableViewViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self.ex_tableViewViewModel cl_tableViewHTTPRequest];
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

@end

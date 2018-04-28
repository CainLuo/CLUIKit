//
//  EXAlertController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAlertController.h"
#import "EXAlertViewModel.h"
#import "EXAlertDelegate.h"
#import "EXAlertDataSource.h"

@interface EXAlertController ()

@property (nonatomic, strong) EXAlertDelegate   *ex_alertDelegate;
@property (nonatomic, strong) EXAlertDataSource *ex_alertDataSource;
@property (nonatomic, strong) EXAlertViewModel  *ex_alertViewModel;

@end

@implementation EXAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setTableViewDelegate:self.ex_alertDelegate
                       dataSource:self.ex_alertDataSource];
    
    [self cl_dropDownBeginRefresh];
}

- (BOOL)cl_navigationShouldPopOnBackButton {
    
    NSLog(@"哈哈哈");
    
    return YES;
}

- (void)cl_dropDownRefresh {
    
    [self.ex_alertViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self.ex_alertViewModel cl_tableViewHTTPRequest];
}

- (EXAlertDataSource *)ex_alertDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_alertDataSource);
    
    _ex_alertDataSource = [[EXAlertDataSource alloc] initTableViewDataSourceWithViewModel:self.ex_alertViewModel];
    
    return _ex_alertDataSource;
}

- (EXAlertDelegate *)ex_alertDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_alertDelegate);
    
    _ex_alertDelegate = [[EXAlertDelegate alloc] initTableViewDelegateWithViewModel:self.ex_alertViewModel];
    
    return _ex_alertDelegate;
}

- (EXAlertViewModel *)ex_alertViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_alertViewModel);
    
    _ex_alertViewModel = [[EXAlertViewModel alloc] initTableViewBaseModelWithController:self];
    
    return _ex_alertViewModel;
}


@end

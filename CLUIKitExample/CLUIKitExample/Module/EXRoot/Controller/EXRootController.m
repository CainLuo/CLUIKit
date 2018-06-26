//
//  EXRootController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXRootController.h"
#import "EXRootDelegate.h"
#import "EXRootDataSource.h"
#import "EXRootViewModel.h"

@interface EXRootController ()

@property (nonatomic, strong) EXRootDelegate   *ex_rootDelegate;
@property (nonatomic, strong) EXRootDataSource *ex_rootDataSource;
@property (nonatomic, strong) EXRootViewModel  *ex_rootViewModel;

@property (nonatomic, strong, readwrite) EXRootTransitioningDelegate *ex_rootTransitioningDelegate;

@end

@implementation EXRootController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self ex_addConstraintsWithSuperView];

    [self cl_setTableViewDelegate:self.ex_rootDelegate
                       dataSource:self.ex_rootDataSource];

    [self cl_dropDownBeginRefresh];
}

- (void)cl_dropDownRefresh {
    
    [self.ex_rootViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self cl_pullUpEndRefresh];
}

- (EXRootDataSource *)ex_rootDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_rootDataSource);
    
    _ex_rootDataSource = [[EXRootDataSource alloc] initTableViewDataSourceWithViewModel:self.ex_rootViewModel];
    
    return _ex_rootDataSource;
}

- (EXRootDelegate *)ex_rootDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_rootDelegate);
    
    _ex_rootDelegate = [[EXRootDelegate alloc] initTableViewDelegateWithViewModel:self.ex_rootViewModel];
    
    return _ex_rootDelegate;
}

- (EXRootViewModel *)ex_rootViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_rootViewModel);
    
    _ex_rootViewModel = [[EXRootViewModel alloc] initTableViewBaseModelWithController:self];
    
    return _ex_rootViewModel;
}

- (EXRootTransitioningDelegate *)ex_rootTransitioningDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_rootTransitioningDelegate);
    
    _ex_rootTransitioningDelegate = [[EXRootTransitioningDelegate alloc] initViewControllerTransitioningDelegateWithController:self];
    
    return _ex_rootTransitioningDelegate;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            
            (void)make.top.bottom;
        }
        
        (void)make.left.right;
    }];
}

@end

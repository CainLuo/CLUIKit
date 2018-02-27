//
//  EXFontController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXFontController.h"
#import "EXFontDateSource.h"
#import "EXFontDelegate.h"
#import "EXFontViewModel.h"

@interface EXFontController ()

@property (nonatomic, strong) EXFontDateSource *ex_fontDateSource;
@property (nonatomic, strong) EXFontDelegate   *ex_fontDelegate;
@property (nonatomic, strong) EXFontViewModel  *ex_fontViewModel;

@end

@implementation EXFontController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_addConstraintsWithSuperView];
    
    [self cl_setTableViewDelegate:self.ex_fontDelegate
                       dataSource:self.ex_fontDateSource];
    
    [self cl_dropDownBeginRefresh];
}

- (void)cl_dropDownRefresh {
    
    [self.ex_fontViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self.ex_fontViewModel cl_tableViewHTTPRequest];
}

- (EXFontDelegate *)ex_fontDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_fontDelegate);
    
    _ex_fontDelegate = [[EXFontDelegate alloc] initTableViewDelegateWithViewModel:self.ex_fontViewModel];
    
    return _ex_fontDelegate;
}

- (EXFontDateSource *)ex_fontDateSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_fontDateSource);
    
    _ex_fontDateSource = [[EXFontDateSource alloc] initTableViewDataSourceWithViewModel:self.ex_fontViewModel];
    
    return _ex_fontDateSource;
}

- (EXFontViewModel *)ex_fontViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_fontViewModel);
    
    _ex_fontViewModel = [[EXFontViewModel alloc] initTableViewBaseModelWithController:self];
    
    return _ex_fontViewModel;
}

- (void)cl_addConstraintsWithSuperView {
    
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

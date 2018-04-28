//
//  EXScrollViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXScrollViewController.h"
#import "EXScrollViewViewModel.h"
#import "EXScrollViewDelegate.h"

@interface EXScrollViewController ()

@property (nonatomic, strong) EXScrollViewViewModel *ex_scrollViewViewModel;
@property (nonatomic, strong) EXScrollViewDelegate  *ex_scrollViewDelegate;

@end

@implementation EXScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setScrollViewDelegate:self.ex_scrollViewDelegate];
    
    [self.ex_scrollViewViewModel ex_logController];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.cl_scrollView.contentSize = CGSizeMake([UIScreen cl_getScreenWidth], [UIScreen cl_getScreenHeight] * 3);

    [self ex_addConstraintsWithSuperView];
}

- (EXScrollViewDelegate *)ex_scrollViewDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_scrollViewDelegate);
    
    _ex_scrollViewDelegate = [[EXScrollViewDelegate alloc] initScrollViewDelegateWithViewModel:self.ex_scrollViewViewModel];
    
    return _ex_scrollViewDelegate;
}

- (EXScrollViewViewModel *)ex_scrollViewViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_scrollViewViewModel);
    
    _ex_scrollViewViewModel = [[EXScrollViewViewModel alloc] initScrollViewDelegateWithController:self];
    
    return _ex_scrollViewViewModel;
}

- (void)ex_addConstraintsWithSuperView {
    
    self.cl_scrollView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    [self.cl_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
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

//
//  CLPickerController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerController.h"
#import "CLPickerTransitioningDelegate.h"
#import "UIViewController+CLViewController.h"

@interface CLPickerController ()

@property (nonatomic, strong) CLPickerTransitioningDelegate *cl_pickerTransitioningDelegate;

@property (nonatomic, strong, readwrite) CLPickerView     *cl_pickerView;
@property (nonatomic, strong, readwrite) CLPickerToolView *cl_pickerToolView;

@end

@implementation CLPickerController

- (instancetype)initPickerControllerWithHeight:(CGFloat)height {
    
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate  = self.cl_pickerTransitioningDelegate;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        if (height == 0) {
            
            height = [UIScreen cl_fitPlusScreen:800];
        }
        
        self.cl_presentationViewHeight = height;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cl_pickerView];
    [self.view addSubview:self.cl_pickerToolView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self cl_addConstraintsWithSuperView];
}

- (CLPickerView *)cl_pickerView {
    
    if (!_cl_pickerView) {
        
        _cl_pickerView = [[CLPickerView alloc] init];
        
        _cl_pickerView.showsSelectionIndicator = YES;
    }
    
    return _cl_pickerView;
}

- (CLPickerToolView *)cl_pickerToolView {
    
    if(!_cl_pickerToolView) {
        
        _cl_pickerToolView = [[CLPickerToolView alloc] init];
        
        _cl_pickerToolView.hidden = self.cl_hiddenToolView;
    }
    
    return _cl_pickerToolView;
}

- (void)cl_setPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                      dataSource:(id<UIPickerViewDataSource>)dataSource {
    
    self.cl_pickerView.delegate   = delegate;
    self.cl_pickerView.dataSource = dataSource;
}

- (void)cl_configPickerToolViewActions {
    
    __weak __typeof(self) weakSelf = self;

    [self.cl_pickerToolView setCl_pickerToolViewCancelActionBlock:^{
        
        [weakSelf dismissViewControllerAnimated:YES
                                     completion:nil];
    }];
}

- (CLPickerTransitioningDelegate *)cl_pickerTransitioningDelegate {
    
    if (!_cl_pickerTransitioningDelegate) {
        
        _cl_pickerTransitioningDelegate = [[CLPickerTransitioningDelegate alloc] initViewControllerTransitioningDelegateWithController:self];
    }
    
    return _cl_pickerTransitioningDelegate;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self cl_configPickerToolViewActions];
    
    CGFloat cl_pickerToolViewH = self.cl_hiddenToolView ? 0 : [UIScreen cl_fitPlusScreen:132];
    
    [self.cl_pickerToolView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.cl_pickerView.mas_top);
        make.height.mas_equalTo(cl_pickerToolViewH);
        
        if (@available(iOS 11.0, *)) {
            
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            
            (void)make.left.right;
        }
    }];
    
    [self.cl_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(self.cl_presentationViewHeight - cl_pickerToolViewH);
        
        if (@available(iOS 11.0, *)) {
            
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            
            (void)make.left.bottom.right;
        }
    }];
}

@end

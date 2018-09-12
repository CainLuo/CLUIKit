//
//  EXPickerController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXPickerController.h"
#import "EXPickerViewModel.h"
#import "EXPickerDelegate.h"
#import "EXPickerDataSource.h"

@interface EXPickerController ()

@property (nonatomic, strong) EXPickerViewModel  *ex_pickerViewModel;
@property (nonatomic, strong) EXPickerDelegate   *ex_pickerDelegate;
@property (nonatomic, strong) EXPickerDataSource *ex_pickerDataSource;

@end

@implementation EXPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.cl_hiddenToolView    = NO;
    self.cl_pickerRowHeight = 44;
    self.cl_pickerView.cl_selectionColor = [UIColor redColor];

    [self cl_setPickerViewDelegate:self.ex_pickerDelegate
                        dataSource:self.ex_pickerDataSource];
    
    [self.ex_pickerViewModel ex_pickerViewModelRequest];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];    
}

- (EXPickerViewModel *)ex_pickerViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_pickerViewModel);
    
    _ex_pickerViewModel = [[EXPickerViewModel alloc] initPickerViewModelWithController:self];
    
    return _ex_pickerViewModel;
}

- (EXPickerDelegate *)ex_pickerDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_pickerDelegate);
    
    _ex_pickerDelegate = [[EXPickerDelegate alloc] initPickerDelegateWithViewModel:self.ex_pickerViewModel];
    
    return _ex_pickerDelegate;
}

- (EXPickerDataSource *)ex_pickerDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_pickerDataSource);
    
    _ex_pickerDataSource = [[EXPickerDataSource alloc] initPickerDataSourceWithViewModel:self.ex_pickerViewModel];
    
    return _ex_pickerDataSource;
}

@end

//
//  EXTextFieldController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTextFieldController.h"

@interface EXTextFieldController ()

@property (nonatomic, strong) CLTextField *cl_lineTextField;
@property (nonatomic, strong) CLTextField *cl_normalTextField;

@end

@implementation EXTextFieldController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_addConstraintsWithSuperView];
}

- (CLTextField *)cl_lineTextField {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_lineTextField);
    
    _cl_lineTextField = [[CLTextField alloc] init];
    
    _cl_lineTextField.placeholder      = @"请输入内容";
    _cl_lineTextField.cl_lineColor     = [UIColor cl_getARC4RandomColor];
    _cl_lineTextField.cl_textFieldType = CLTextFieldBottomLineType;
    
    return _cl_lineTextField;
}

- (CLTextField *)cl_normalTextField {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_normalTextField);
    
    _cl_normalTextField = [[CLTextField alloc] init];
    
    _cl_normalTextField.placeholder = @"请输入内容";
    
    return _cl_normalTextField;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self.view addSubview:self.cl_lineTextField];
    [self.view addSubview:self.cl_normalTextField];
    
    self.view.backgroundColor = [UIColor cl_colorWithHex:0xf0f0f0];

    [self.cl_lineTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            (void)make.top;
        }

        make.left.offset([UIScreen cl_fitScreen:20]);
        make.right.offset([UIScreen cl_fitScreen:-20]);
        make.height.mas_equalTo([UIScreen cl_fitScreen:100]);
    }];
    
    [self.cl_normalTextField mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.cl_lineTextField.mas_bottom).offset([UIScreen cl_fitScreen:20]);
        
        make.left.right.height.equalTo(self.cl_lineTextField);
    }];
}

@end

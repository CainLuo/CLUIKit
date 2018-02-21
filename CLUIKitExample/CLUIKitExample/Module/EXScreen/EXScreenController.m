//
//  EXScreenController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXScreenController.h"

@interface EXScreenController ()

@property (nonatomic, strong) UITextView *ex_textView;

@end

@implementation EXScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ex_addConstraintsWithSuperView];
    
    [self ex_changeTextFieldContent];
}

- (void)ex_changeTextFieldContent {
    
    NSMutableString *cl_mutableString = [[NSMutableString alloc] init];
    
    [cl_mutableString appendFormat:@"获取屏幕的宽度: %f\n", [UIScreen cl_getScreenWidth]];
    [cl_mutableString appendFormat:@"获取屏幕的高度: %f\n", [UIScreen cl_getScreenHeight]];
    [cl_mutableString appendFormat:@"获取UITabBar的高度: %f\n", [UIScreen cl_getTabBarHeight]];
    [cl_mutableString appendFormat:@"获取UIStatusBar的高度: %f\n", [UIScreen cl_getStatusBarHeight]];
    [cl_mutableString appendFormat:@"获取UINavigationBar的高度: %f\n", [UIScreen cl_getNavigationBarHeight]];

    self.ex_textView.text = cl_mutableString;
}

- (UITextView *)ex_textView {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_textView);
    
    _ex_textView = [[UITextView alloc] init];
    
    _ex_textView.font = [UIFont systemFontOfSize:15];

    return _ex_textView;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_textView];
    
    [self.ex_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            (void)make.top;
        }
        
        (void)make.left.right;
        make.height.mas_equalTo(CGRectGetWidth(self.view.frame));
    }];
}

@end

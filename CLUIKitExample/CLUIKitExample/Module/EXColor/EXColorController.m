
//
//  EXColorController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXColorController.h"

@interface EXColorController ()

@property (nonatomic, strong) UIButton *ex_colorButton;

@end

@implementation EXColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.ex_colorButton];
    
    [self.ex_colorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.center;
    }];
}

- (UIButton *)ex_colorButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_colorButton);
    
    _ex_colorButton = [[UIButton alloc] init];
    
    _ex_colorButton.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    [_ex_colorButton setTitle:@"设置颜色"
                     forState:UIControlStateNormal];
    [_ex_colorButton addTarget:self
                        action:@selector(ex_colorButtonAction:)
              forControlEvents:UIControlEventTouchUpInside];
    
    return _ex_colorButton;
}

- (void)ex_colorButtonAction:(UIButton *)sender {
    
    [self cl_showSheetViewControllerWithTitle:@"设置颜色"
                                      message:@"选择您要的颜色"
                                 actionTitles:@[@"随机色", @"十六进制数值颜色值", @"十六进制字符颜色值", @"三原色", @"渐变色"]
                                      handler:^(UIAlertAction *action, NSUInteger idex) {
                                          
                                          [self ex_changeColorWithIndex:idex];
                                      }];
}

- (void)ex_changeColorWithIndex:(NSUInteger)idex {
    
    NSLog(@"%ld", idex);
    
    switch (idex) {
        case 0:
            self.view.backgroundColor = [UIColor cl_getARC4RandomColor];
            
            break;
        case 1:
            self.view.backgroundColor = [UIColor cl_colorWithHex:0x2e7ae6];

            break;
        case 2:
            self.view.backgroundColor = [UIColor cl_colorWithHexString:@"#D8D8D8"];
            
            break;
        case 3:
            self.view.backgroundColor = [UIColor cl_colorWithRed:120.0
                                                           green:20.0
                                                            blue:0.0];
            
            break;
        case 4:
            
            self.view.backgroundColor = [UIColor cl_configGradientWithBeginColor:[UIColor greenColor]
                                                                        endColor:[UIColor redColor]
                                                                          height:[UIScreen cl_getScreenHeight]];
            
            break;
        default:
            break;
    }
}

@end

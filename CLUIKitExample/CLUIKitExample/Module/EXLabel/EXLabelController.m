//
//  EXLabelController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2019/1/7.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

#import "EXLabelController.h"

@interface EXLabelController ()

@property (nonatomic, strong) UILabel *ex_contentLabel;

@end

@implementation EXLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat ex_textWidth   = [self.ex_contentLabel cl_getLabelTextWidth];
    CGFloat ex_textHeight  = [self.ex_contentLabel cl_getLabelTextHeight];
    CGFloat ex_lineHeight  = [self.ex_contentLabel cl_getLabelLineHeight];
    CGFloat ex_numberLines = [self.ex_contentLabel cl_getLabelNumberOfLines];

    NSLog(@"text width: %f", ex_textWidth);
    NSLog(@"text Height: %f", ex_textHeight);
    NSLog(@"line Height: %f", ex_lineHeight);
    NSLog(@"number Lines: %f", ex_numberLines);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (UILabel *)ex_contentLabel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_contentLabel);
    
    _ex_contentLabel = [[UILabel alloc] init];
    
    _ex_contentLabel.text          = @"qweqweqweqweqweqwe\nqweqweqweqweqweqweqwe";
    _ex_contentLabel.numberOfLines = 0;

    return _ex_contentLabel;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_contentLabel];
    
    [self.ex_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.center.left.right;
    }];
}

@end

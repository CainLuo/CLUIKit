//
//  EXBarButtonItemController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXBarButtonItemController.h"

@interface EXBarButtonItemController ()

@property (nonatomic, strong) UILabel *ex_contentLabel;

@end

@implementation EXBarButtonItemController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (void)ex_configRightBarButtonItem {
    
    CL_WEAK_SELF(weakSelf);
    
    UIBarButtonItem *ex_barButtonItem = [[UIBarButtonItem alloc] init];
    
    ex_barButtonItem.style = UIBarButtonItemStylePlain;
    ex_barButtonItem.title = @"分享";
    
    [ex_barButtonItem setCl_barButtonItemAction:^(UIBarButtonItem *sender) {
        
        weakSelf.ex_contentLabel.text = [NSString stringWithFormat:@"点击了%@", sender.title];
    }];
    
    self.navigationItem.rightBarButtonItem = ex_barButtonItem;
}

- (UILabel *)ex_contentLabel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_contentLabel);
    
    _ex_contentLabel = [[UILabel alloc] init];
    
    _ex_contentLabel.text          = @"你点了什么?";
    _ex_contentLabel.font          = [UIFont cl_fitSystemFontOfSize:30];
    _ex_contentLabel.textColor     = [UIColor blackColor];
    _ex_contentLabel.textAlignment = NSTextAlignmentCenter;
    
    return _ex_contentLabel;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self ex_configRightBarButtonItem];

    [self.view addSubview:self.ex_contentLabel];
    
    [self.ex_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerY.left.right;
    }];
}

@end

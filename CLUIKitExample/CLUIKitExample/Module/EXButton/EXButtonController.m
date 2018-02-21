//
//  EXButtonController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXButtonController.h"

typedef NS_ENUM(NSInteger, EXButtonType) {
    EXButtonTypeImage = 0,
    EXButtonTypeStar,
    EXButtonTypeClick
};

@interface EXButtonController ()

@property (nonatomic, strong) UIButton *ex_starButton;
@property (nonatomic, strong) UIButton *ex_clickButton;

@end

@implementation EXButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setNavigationBarTranslucentWithBOOL:NO];
    
    [self cl_imageButton];
    
    [self cl_addConstraintsWithSuperView];
}

#pragma mark - 修改Button图片的显示位置
- (void)cl_imageButton {
    
    NSArray *cl_buttonStyles = @[@(CLButtonImageTopStyle),
                                 @(CLButtonImageLeftStyle),
                                 @(CLButtonImageBottomStyle),
                                 @(CLButtonImageRightStyle)];
    
    [cl_buttonStyles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CLButtonStyle cl_buttonStyle = (CLButtonStyle)[obj integerValue];
        
        CLButton *cl_button = [[CLButton alloc] init];
        
        cl_button.tag                 = EXButtonTypeImage;
        cl_button.cl_imageSize        = CGSizeMake([UIScreen cl_fitScreen:30], [UIScreen cl_fitScreen:30]);
        cl_button.cl_imageSpacing     = [UIScreen cl_fitScreen:10];
        cl_button.cl_buttomImageStyle = cl_buttonStyle;
        cl_button.backgroundColor     = [UIColor cl_getARC4RandomColor];
        
        [cl_button setTitle:[NSString stringWithFormat:@"按钮%ld", idx]
                      forState:UIControlStateNormal];
        [cl_button setImage:[UIImage imageNamed:@"icon1"]
                      forState:UIControlStateNormal];
        [cl_button addTarget:self
                      action:@selector(cl_buttonActions:)
            forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:cl_button];
        
        CGFloat cl_buttonW = CGRectGetWidth(self.view.frame) / 4;
        
        [cl_button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            if (@available(iOS 11.0, *)) {
                
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                (void)make.top;
            }
            
            make.left.mas_equalTo(cl_buttonW * idx);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(cl_buttonW);
        }];
    }];
}

#pragma mark - 倒计时Button

- (UIButton *)ex_starButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_starButton);

    _ex_starButton = [[UIButton alloc] init];
    
    _ex_starButton.tag             = EXButtonTypeStar;
    _ex_starButton.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    [_ex_starButton setTitle:@"开始倒计时"
                    forState:UIControlStateNormal];
    [_ex_starButton setTitleColor:[UIColor whiteColor]
                         forState:UIControlStateNormal];
    [_ex_starButton addTarget:self
                       action:@selector(cl_buttonActions:)
             forControlEvents:UIControlEventTouchUpInside];

    return _ex_starButton;
}

- (void)cl_buttonActions:(UIButton *)sender {
    
    if (sender.tag == EXButtonTypeStar) {
        
        [sender cl_starButtonWithTime:10
                             complete:^(UIButton *ex_starButton, CLButtonStarStyle cl_buttonStarStyle, NSInteger time) {
                                 
                                 if (cl_buttonStarStyle == CLButtonStarStyleBegin) {
                                     
                                     [ex_starButton setTitle:[NSString stringWithFormat:@"%ld", time]
                                                    forState:UIControlStateNormal];
                                     
                                 } else {
                                     
                                     [ex_starButton setTitle:@"开始倒计时"
                                                    forState:UIControlStateNormal];
                                 }
                             }];
    } else {
        
        NSLog(@"\"%@\"按钮被点击了", sender.titleLabel.text);
    }
}

#pragma mark - 修改点击区域
- (UIButton *)ex_clickButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_clickButton);

    _ex_clickButton = [[UIButton alloc] init];

    _ex_clickButton.tag             = EXButtonTypeClick;
    _ex_clickButton.backgroundColor = [UIColor cl_getARC4RandomColor];
    _ex_clickButton.cl_clickAreaEdgeInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    
    [_ex_clickButton setTitle:@"修改点击区域"
                     forState:UIControlStateNormal];
    [_ex_clickButton setTitleColor:[UIColor whiteColor]
                          forState:UIControlStateNormal];
    [_ex_clickButton addTarget:self
                        action:@selector(cl_buttonActions:)
              forControlEvents:UIControlEventTouchUpInside];
    
    return _ex_clickButton;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_clickButton];
    [self.view addSubview:self.ex_starButton];
    
    [self.ex_starButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(50);
        } else {
            (void)make.top.offset(50);
        }
        
        (void)make.left.right;
        make.height.mas_equalTo(50);
    }];

    [self.ex_clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerX;
        make.top.equalTo(self.ex_starButton.mas_bottom).offset(50);
        make.size.mas_equalTo(CGSizeMake(120, 50));
    }];
}

@end

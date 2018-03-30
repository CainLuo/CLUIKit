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
    
    [self ex_imageButton];
    
    [self ex_addConstraintsWithSuperView];
}

#pragma mark - 修改Button图片的显示位置
- (void)ex_imageButton {
    
    NSArray *ex_buttonStyles = @[@(CLButtonImageTopStyle),
                                 @(CLButtonImageLeftStyle),
                                 @(CLButtonImageBottomStyle),
                                 @(CLButtonImageRightStyle)];
    
    [ex_buttonStyles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CLButtonStyle ex_buttonStyle = (CLButtonStyle)[obj integerValue];
        
        CLButton *ex_button = [[CLButton alloc] init];
        
        ex_button.tag                 = EXButtonTypeImage;
        ex_button.cl_imageSize        = CGSizeMake([UIScreen cl_fitScreen:30], [UIScreen cl_fitScreen:30]);
        ex_button.cl_imageSpacing     = [UIScreen cl_fitScreen:10];
        ex_button.cl_buttomImageStyle = ex_buttonStyle;
        ex_button.backgroundColor     = [UIColor cl_getARC4RandomColor];
        
        [ex_button cl_setNormalButtonWithImage:[UIImage imageNamed:@"icon1"]];
        [ex_button cl_setNormalButtonWithTitle:[NSString stringWithFormat:@"按钮%ld", idx]];
        [ex_button cl_addButtonActionComplete:^(UIButton *sender) {
            
            NSLog(@"UIButton Normal状态下的图片: %@", [sender cl_getNormalButtonImage]);

            [self ex_buttonActions:sender];
        }];

        [self.view addSubview:ex_button];
        
        CGFloat ex_buttonW = CGRectGetWidth(self.view.frame) / 4;
        
        [ex_button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            if (@available(iOS 11.0, *)) {
                
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                (void)make.top;
            }
            
            make.left.mas_equalTo(ex_buttonW * idx);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(ex_buttonW);
        }];
    }];
}

#pragma mark - 倒计时Button
- (UIButton *)ex_starButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_starButton);

    _ex_starButton = [[UIButton alloc] init];
    
    _ex_starButton.tag             = EXButtonTypeStar;
    _ex_starButton.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    [_ex_starButton cl_setNormalButtonWithTitle:@"开始倒计时"];
    [_ex_starButton cl_setNormalButtonWithTitleColor:[UIColor whiteColor]];
    
    [_ex_starButton cl_addButtonActionComplete:^(UIButton *sender) {
        
        [self ex_buttonActions:sender];
    }];

    return _ex_starButton;
}

- (void)ex_buttonActions:(UIButton *)sender {
    
    if (sender.tag == EXButtonTypeStar) {
        
        [sender cl_starButtonWithTime:10
                             complete:^(UIButton *ex_starButton, CLButtonStarStyle ex_buttonStarStyle, NSInteger time) {
                                 
                                 if (ex_buttonStarStyle == CLButtonStarStyleBegin) {
                                     
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
    
    [_ex_clickButton cl_setNormalButtonWithTitle:@"修改点击区域"];
    [_ex_clickButton cl_setNormalButtonWithTitleColor:[UIColor whiteColor]];

    [_ex_clickButton cl_addButtonActionComplete:^(UIButton *sender) {
        
        [sender cl_showActivityIndicatorViewWithStyle:UIActivityIndicatorViewStyleGray];
        
        NSLog(@"按钮是否正在加载中: %@", sender.cl_isSubmitting ? @"YES" : @"NO");
        
        [NSObject cl_performWithAfterSecond:2.0f
                                   complete:^{
                                       
                                       [sender cl_hideActivityIndicatorView];
                                       
                                       NSLog(@"2秒后按钮是否正在加载中: %@", sender.cl_isSubmitting ? @"YES" : @"NO");
                                   }];
    }];

    return _ex_clickButton;
}

- (void)ex_addConstraintsWithSuperView {
    
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

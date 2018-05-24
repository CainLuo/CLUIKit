//
//  EXAnimatorController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/24.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAnimatorController.h"

@interface EXAnimatorController ()

@property (nonatomic, strong) UIView *ex_animationView;

@property (nonatomic, strong) UIButton *ex_chooseButton;
@property (nonatomic, strong) UIButton *ex_resetButton;

@end

@implementation EXAnimatorController

#pragma mark - UICubicTimingParameters
- (void)ex_cubicTimingParametersAnimation {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_cubicTimingParametersWithDuration:5
                                                           curve:UIViewAnimationCurveEaseIn
                                                      animations:^{
                                                          
                                                          [weakSelf ex_moveViewToRight];
                                                      }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_cubicTimingParametersAnimationBlock {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_cubicTimingParametersWithDuration:5
                                                           curve:UIViewAnimationCurveEaseInOut
                                                      animations:^{
                                                       
                                                          [weakSelf ex_moveViewToRight];
                                                      }
                                                      completion:^(UIViewAnimatingPosition finalPosition) {
            
                                                          NSLog(@"动画的状态为: %ld", finalPosition);
                                                      }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_cubicTimingParametersPointAnimation {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_cubicTimingParametersWithDuration:5
                                                   controlPoint1:CGPointMake(0.1, 1)
                                                   controlPoint2:CGPointMake(0.5, 1)
                                                      animations:^{
                                                          
                                                          [weakSelf ex_moveViewToRight];
                                                      }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_cubicTimingParametersPointAnimationBlock {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_cubicTimingParametersWithDuration:5
                                                   controlPoint1:CGPointMake(0.1, 1)
                                                   controlPoint2:CGPointMake(0.5, 1)
                                                      animations:^{
                                                          
                                                          [weakSelf ex_moveViewToRight];
                                                      }
                                                      completion:^(UIViewAnimatingPosition finalPosition) {

                                                          NSLog(@"动画的状态为: %ld", finalPosition);
                                                      }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}
#pragma mark - UISpringTimingParameters
- (void)ex_springTimingParametersAnimation {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                     dampingRatio:0.5
                                                       animations:^{
            
                                                           [weakSelf ex_moveViewToRight];
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_springTimingParametersAnimationBlock {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                     dampingRatio:0.5
                                                       animations:^{
                                                           
                                                           [weakSelf ex_moveViewToRight];
                                                       }
                                                       completion:^(UIViewAnimatingPosition finalPosition) {
                                                           
                                                           NSLog(@"动画的状态为: %ld", finalPosition);
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_springTimingParametersVelocityAnimation {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                     dampingRatio:0.5
                                                         velocity:CGVectorMake(0.1, 0.9)
                                                       animations:^{
            
                                                           [weakSelf ex_moveViewToRight];
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_springTimingParametersVelocityAnimationBlock {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                     dampingRatio:0.5
                                                         velocity:CGVectorMake(0.1, 0.9)
                                                       animations:^{
                                                           
                                                           [weakSelf ex_moveViewToRight];
                                                       }
                                                       completion:^(UIViewAnimatingPosition finalPosition) {
                                                           
                                                           NSLog(@"动画的状态为: %ld", finalPosition);
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_springTimingParametersMSDVAnimation {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);

        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                             mass:1
                                                        stiffness:20
                                                          damping:0.5
                                                         velocity:CGVectorMake(0.1, 0.9)
                                                       animations:^{
            
                                                           [weakSelf ex_moveViewToRight];
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_springTimingParametersMSDVAnimationBlock {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);
        
        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_springTimingParametersWithDuration:5
                                                             mass:1
                                                        stiffness:20
                                                          damping:0.5
                                                         velocity:CGVectorMake(0.1, 0.9)
                                                       animations:^{
                                                           
                                                           [weakSelf ex_moveViewToRight];
                                                       }
                                                       completion:^(UIViewAnimatingPosition finalPosition) {
                                                           
                                                           NSLog(@"动画的状态为: %ld", finalPosition);
                                                       }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

#pragma mark - UIViewPropertyAnimator
- (void)ex_viewPropertyAnimatorLinear {
    
    if (@available(iOS 10.0, *)) {
        CL_WEAK_SELF(weakSelf);
        
        CLAnimatorManager *cl_animatorManager = [[CLAnimatorManager alloc] init];
        
        [cl_animatorManager cl_viewPropertyAnimatorWithDuration:5
                                                          curve:UIViewAnimationCurveLinear
                                                     animations:^{
            
                                                         [weakSelf ex_moveViewToRight];
                                                     }];
        
        [cl_animatorManager cl_starViewPropertyAnimator];
    }
}

- (void)ex_showSheetViewController {
    
    NSArray *ex_animationArray = @[@"CubicTimingEaseIn",
                                   @"CubicTimingEaseInBlock",
                                   @"CubicTimingPointEaseIn",
                                   @"CubicTimingPointEaseInBlock",
                                   @"SpringTimingParametersAnimation",
                                   @"SpringTimingParametersAnimationBlock",
                                   @"SpringTimingParametersVelocityAnimation",
                                   @"SpringTimingParametersVelocityAnimationBlock",
                                   @"SpringTimingParametersMSDVAnimation",
                                   @"SpringTimingParametersMSDVAnimationBlock",
                                   @"ViewPropertyAnimatorLinear"];
    
    [self cl_showSheetViewControllerWithTitle:@"选择动画"
                                      message:@"请选择您要执行的动画效果"
                                 actionTitles:ex_animationArray
                                     complete:^(UIAlertAction *action, NSUInteger index) {
                                         
                                         switch (index) {
                                             case 0:
                                                 
                                                 [self ex_cubicTimingParametersAnimation];
                                                 break;
                                             case 1:
                                                 
                                                 [self ex_cubicTimingParametersAnimationBlock];
                                                 break;
                                             case 2:
                                                 
                                                 [self ex_cubicTimingParametersPointAnimation];
                                                 break;
                                             case 3:
                                                 
                                                 [self ex_cubicTimingParametersPointAnimationBlock];
                                                 break;
                                             case 4:
                                                 
                                                 [self ex_springTimingParametersAnimation];
                                                 break;
                                             case 5:
                                                 
                                                 [self ex_springTimingParametersAnimationBlock];
                                                 break;
                                             case 6:
                                                 
                                                 [self ex_springTimingParametersVelocityAnimation];
                                                 break;
                                             case 7:
                                                 
                                                 [self ex_springTimingParametersVelocityAnimationBlock];
                                                 break;
                                             case 8:
                                                 
                                                 [self ex_springTimingParametersMSDVAnimation];
                                                 break;
                                             case 9:
                                                 
                                                 [self ex_springTimingParametersMSDVAnimationBlock];
                                                 break;
                                                 
                                             case 10:
                                                 
                                                 [self ex_viewPropertyAnimatorLinear];
                                                 break;
                                             default:
                                                 break;
                                         }
                                     }];
}

- (void)ex_moveViewToRight {
    
    self.ex_animationView.cl_centerX = [UIScreen cl_getScreenWidth] - [UIScreen cl_fitScreen:75];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (UIView *)ex_animationView {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_animationView);
    
    _ex_animationView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 [UIScreen cl_fitScreen:150],
                                                                 [UIScreen cl_fitScreen:150])];
    
    _ex_animationView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return _ex_animationView;
}

- (UIButton *)ex_chooseButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_chooseButton);
    CL_WEAK_SELF(weakSelf);

    _ex_chooseButton = [[UIButton alloc] init];
    
    [_ex_chooseButton cl_setNormalButtonWithTitle:@"选择动画"];
    [_ex_chooseButton cl_setNormalButtonBackgroundImageWithColor:[UIColor cl_colorWithHex:0x2e7ae6]];
    [_ex_chooseButton cl_addButtonActionComplete:^(UIButton *sender) {
        
        [weakSelf ex_showSheetViewController];
    }];
    
    return _ex_chooseButton;
}

- (UIButton *)ex_resetButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_resetButton);
    CL_WEAK_SELF(weakSelf);

    _ex_resetButton = [[UIButton alloc] init];
    
    [_ex_resetButton cl_setNormalButtonWithTitle:@"重置"];
    [_ex_resetButton cl_setNormalButtonBackgroundImageWithColor:[UIColor cl_getARC4RandomColor]];
    [_ex_resetButton cl_addButtonActionComplete:^(UIButton *sender) {
        
        weakSelf.ex_animationView.frame = CGRectMake(0,
                                                     0,
                                                     [UIScreen cl_fitScreen:150],
                                                     [UIScreen cl_fitScreen:150]);
    }];
    
    return _ex_resetButton;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_animationView];
    [self.view addSubview:self.ex_chooseButton];
    [self.view addSubview:self.ex_resetButton];

    [self.ex_chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo([UIScreen cl_fitScreen:100]);
        make.width.equalTo(self.view).dividedBy(2);
        
        if (@available(iOS 11.0, *)) {
            
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            
            (void)make.left.bottom;
        }
    }];
    
    [self.ex_resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(self.ex_chooseButton);
        
        if (@available(iOS 11.0, *)) {
            
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            
            (void)make.right.bottom;
        }
    }];
}

@end

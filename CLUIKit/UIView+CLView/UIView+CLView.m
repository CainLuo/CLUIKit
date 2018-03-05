//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIView+CLView.m
//  ShareHotel
//
//  Created by Mac on 2017/12/8.
//  Copyright © 2017年 EStrongersoft Co., LTD. All rights reserved.
//

#import "UIView+CLView.h"
#import "NSObject+CLObject.h"

@implementation UIView (CLView)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (@available(iOS 11, *)) {
            
            [self cl_exchangeImplementationsWithClass:NSClassFromString(@"_UIBackButtonContainerView")
                                     originalSelector:@selector(addSubview:)
                                     swizzledSelector:@selector(cl_backButtonTitleAddSubview:)];
        }
    });
}

- (void)cl_backButtonTitleAddSubview:(UIView *)view {
    
    view.alpha = 0;
    
    if ([view isKindOfClass:[UIButton class]]) {
        
        UIButton *button = (UIButton *)view;
        
        [button setTitle:@""
                forState:UIControlStateNormal];
    }
    
    [self cl_backButtonTitleAddSubview:view];
}

@end

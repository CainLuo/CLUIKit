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
    
    if (@available(iOS 11, *)) {
        
        [self cl_exchangeImplementationsWithClass:NSClassFromString(@"_UIBackButtonContainerView")
                                 originalSelector:@selector(addSubview:)
                                 swizzledSelector:@selector(backButtonTitle_addSubview:)];
    }
}

- (void)backButtonTitle_addSubview:(UIView *)view {
    
    view.alpha = 0;
    
    if ([view isKindOfClass:[UIButton class]]) {
        
        UIButton *button = (UIButton *)view;
        
        [button setTitle:@""
                forState:UIControlStateNormal | UIControlStateHighlighted | UIControlStateDisabled | UIControlStateSelected];
    }

    [self backButtonTitle_addSubview:view];
}

@end

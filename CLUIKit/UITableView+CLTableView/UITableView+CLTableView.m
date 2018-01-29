//
//  UITableView+CLTableView.m
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UITableView+CLTableView.h"
#import <objc/runtime.h>

static void *CLPlaceholderView = &CLPlaceholderView;

@implementation UITableView (CLTableView)

- (void)cl_reloadData {
    
    [self reloadData];
    
    [self cl_checkEmpty];
}

- (void)cl_checkEmpty {
    
    BOOL isEmpty = YES;
    
    id<UITableViewDataSource> cl_dataSource = self.dataSource;
    
    NSInteger cl_sections = 1;
    
    if ([cl_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        
        cl_sections = [cl_dataSource numberOfSectionsInTableView:self];
    }
    
    for (int i = 0; i < cl_sections; ++i) {
        
        NSInteger rows = [cl_dataSource tableView:self
                            numberOfRowsInSection:i];
        
        if (rows) {
            
            isEmpty = NO;
        }
    }
    
    if (isEmpty) {
        
        self.cl_placeholderView.frame = self.frame;
        
        [self addSubview:self.cl_placeholderView];
        
    } else {
        
        [self.cl_placeholderView removeFromSuperview];
    }
}

#pragma mark - CLPlaceholderView
- (void)setCl_placeholderView:(UIView *)cl_placeholderView {
    
    objc_setAssociatedObject(self, CLPlaceholderView, cl_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cl_placeholderView {
    
    return objc_getAssociatedObject(self, CLPlaceholderView);
}

@end

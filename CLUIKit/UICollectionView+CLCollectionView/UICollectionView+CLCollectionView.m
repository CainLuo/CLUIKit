//
//  UICollectionView+CLCollectionView.m
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UICollectionView+CLCollectionView.h"
#import "UIColor+CLColor.h"
#import <objc/runtime.h>

static void *CLPlaceholderView = &CLPlaceholderView;

@implementation UICollectionView (CLCollectionView)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(reloadData);
        SEL swizzledSelector = @selector(cl_reloadData);
        
        Method originalMethod = class_getInstanceMethod([self class], originalSelector);
        Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
        
        BOOL didAddMethod = class_addMethod([self class],
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            
            class_replaceMethod([self class],
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)cl_reloadData {
    
    [self cl_checkEmptyDataSource];
    [self cl_reloadData];
}

- (void)cl_checkEmptyDataSource {
    
    BOOL cl_isEmpty = YES;
    
    id <UICollectionViewDataSource> cl_dataSource = self.dataSource;
    
    NSInteger cl_sections = 1;
    
    if ([cl_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        
        cl_sections = [cl_dataSource numberOfSectionsInCollectionView:self];
    }
    
    for (NSInteger i = 0; i < cl_sections; i++) {
        
        NSInteger cl_rows = [cl_dataSource collectionView:self
                                   numberOfItemsInSection:i];
        
        if (cl_rows) {
            
            cl_isEmpty = NO;
        }
    }
    
    if (cl_isEmpty) {
        
        if (!self.cl_placeholderView) {
            
            UIView *cl_placeholderView = [[UIView alloc] initWithFrame:self.bounds];
            
            cl_placeholderView.backgroundColor = [UIColor cl_colorWithHex:0xf0f0f0];
            
            self.cl_placeholderView = cl_placeholderView;
        }
        
        self.cl_placeholderView.hidden = NO;
        
        [self addSubview:self.cl_placeholderView];
        
    } else {
        
        self.cl_placeholderView.hidden = YES;
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

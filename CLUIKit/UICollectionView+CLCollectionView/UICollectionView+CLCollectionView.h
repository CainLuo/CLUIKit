//
//  UICollectionView+CLCollectionView.h
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLCollectionViewPlaceholderDelegate <NSObject>

@required

/**
 设置一个UICollectionView占位图
 
 @return UIView
 */
- (UIView *)cl_placeholderView;

@optional

/**
 出现占位图的时候是否允许滑动
 
 @return BOOL
 */
- (BOOL)cl_scrollEnabledWithShowPlaceholderView;

@end

@interface UICollectionView (CLCollectionView)

- (void)cl_reloadData;

@end

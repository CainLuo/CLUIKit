//
//  UITableView+CLTableView.h
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UITableViewPlaceholderDelegate <NSObject>

@required

/**
 设置一个UITableView占位图

 @return UIView
 */
- (UIView *)cl_placeholderView;

@end

@interface UITableView (CLTableView)

/**
 无数据占位图, 默认显示, 可自定义后赋值
 */
@property (nonatomic, strong) UIView *cl_placeholderView;

- (void)cl_reloadData;

@end

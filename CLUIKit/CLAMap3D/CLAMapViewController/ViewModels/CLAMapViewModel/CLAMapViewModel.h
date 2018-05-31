//
//  CLAMapViewModel.h
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLAMapViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLAMapViewModel : NSObject

/**
 只读的CLAMapViewController
 */
@property (nonatomic, weak, readonly) CLAMapViewController *cl_aMapViewController;

/**
 初始化CLAMapViewModel

 @param controller CLAMapViewController
 @return CLAMapViewModel
 */
- (instancetype)initAMapViewModelWithController:(CLAMapViewController *)controller;

@end
NS_ASSUME_NONNULL_END

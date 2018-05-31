//
//  CLAMapDelegate.h
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapView.h>

#import "CLAMapViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLAMapDelegate : NSObject <MAMapViewDelegate>

/**
 只读的CLAMapViewModel
 */
@property (nonatomic, weak, readonly) CLAMapViewModel *cl_aMapViewModel;

/**
 初始化CLAMapDelegate

 @param viewModel CLAMapViewModel
 @return CLAMapDelegate
 */
- (instancetype)initAMapDelegateWithViewModel:(CLAMapViewModel *)viewModel;

@end
NS_ASSUME_NONNULL_END

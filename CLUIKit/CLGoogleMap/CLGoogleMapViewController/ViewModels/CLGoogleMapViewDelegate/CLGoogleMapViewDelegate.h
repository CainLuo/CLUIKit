//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLGoogleMapViewDelegate.h
//  CLGoogleMap
//
//  Created by Cain Luo on 2018/5/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLGoogleMapViewViewModel.h"
#import <GoogleMaps/GoogleMaps.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLGoogleMapViewDelegate : NSObject <GMSMapViewDelegate>

/**
 只读的CLGoogleMapViewViewModel
 */
@property (nonatomic, weak, readonly) CLGoogleMapViewViewModel *cl_googleMapViewViewModel;

/**
 初始化CLGoogleMapViewDelegate

 @param viewModel CLGoogleMapViewViewModel
 @return self
 */
- (instancetype)initGoogleMapViewDelegateWithViewModel:(CLGoogleMapViewViewModel *)viewModel;

@end
NS_ASSUME_NONNULL_END

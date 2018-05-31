//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLGoogleMapViewViewModel.h
//  CLGoogleMap
//
//  Created by Cain Luo on 2018/5/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLGoogleMapViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLGoogleMapViewViewModel : NSObject

/**
 只读的CLGoogleMapViewController
 */
@property (nonatomic, weak, readonly) CLGoogleMapViewController *cl_googleMapViewController;

/**
 初始化CLGoogleMapViewViewModel

 @param controller CLGoogleMapViewController
 @return self
 */
- (instancetype)initGoogleMapViewViewModelWithController:(CLGoogleMapViewController *)controller;

@end
NS_ASSUME_NONNULL_END

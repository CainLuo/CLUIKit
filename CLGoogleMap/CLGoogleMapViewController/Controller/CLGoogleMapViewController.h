//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLGoogleMapViewController.h
//  CLGoogleMap
//
//  Created by Cain Luo on 2018/5/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

/*
 在使用谷歌地图之前, 必须先使用[GMSServices provideAPIKey:@"APP_KEY"]去注册谷歌服务,
 否则会造成Crash的问题
 */

NS_ASSUME_NONNULL_BEGIN
@interface CLGoogleMapViewController : UIViewController

/**
 只读的GMSMapView
 */
@property (nonatomic, strong, readonly) GMSMapView *cl_mapView;

/**
 设置GMSMapView的GMSMapViewDelegate

 @param delegate GMSMapViewDelegate
 */
- (void)cl_setGoogleMapViewDelegate:(id <GMSMapViewDelegate>)delegate;

@end
NS_ASSUME_NONNULL_END

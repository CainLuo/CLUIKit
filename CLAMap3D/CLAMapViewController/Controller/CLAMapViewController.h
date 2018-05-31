//
//  CLAMapViewController.h
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapView.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLAMapViewController : UIViewController

/**
 只读的MAMapView
 */
@property (nonatomic, strong, readonly) MAMapView *cl_mapView;

/**
 设置MAMapView的MAMapViewDelegate

 @param delegate MAMapViewDelegate
 */
- (void)cl_setMapViewDelegate:(id<MAMapViewDelegate>)delegate;

@end
NS_ASSUME_NONNULL_END

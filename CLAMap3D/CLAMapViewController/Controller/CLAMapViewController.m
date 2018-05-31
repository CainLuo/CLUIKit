//
//  CLAMapViewController.m
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLAMapViewController.h"

@interface CLAMapViewController ()

@property (nonatomic, strong, readwrite) MAMapView *cl_mapView;

@end

@implementation CLAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cl_mapView];
}

- (void)cl_setMapViewDelegate:(id<MAMapViewDelegate>)delegate {
    
    self.cl_mapView.delegate = delegate;
}

- (MAMapView *)cl_mapView {
    
    if (!_cl_mapView) {
        
        _cl_mapView = [[MAMapView alloc] initWithFrame:self.view.frame];
    }
    
    return _cl_mapView;
}

@end

//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLGoogleMapViewDelegate.m
//  CLGoogleMap
//
//  Created by Cain Luo on 2018/5/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLGoogleMapViewDelegate.h"

@interface CLGoogleMapViewDelegate ()

@property (nonatomic, weak, readwrite) CLGoogleMapViewViewModel *cl_googleMapViewViewModel;

@end

@implementation CLGoogleMapViewDelegate


- (instancetype)initGoogleMapViewDelegateWithViewModel:(CLGoogleMapViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_googleMapViewViewModel = viewModel;
    }
    
    return self;
}

@end

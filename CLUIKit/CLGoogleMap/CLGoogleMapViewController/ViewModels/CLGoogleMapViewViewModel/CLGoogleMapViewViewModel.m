//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLGoogleMapViewViewModel.m
//  CLGoogleMap
//
//  Created by Cain Luo on 2018/5/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLGoogleMapViewViewModel.h"

@interface CLGoogleMapViewViewModel ()

@property (nonatomic, weak, readwrite) CLGoogleMapViewController *cl_googleMapViewController;

@end

@implementation CLGoogleMapViewViewModel

- (instancetype)initGoogleMapViewViewModelWithController:(CLGoogleMapViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_googleMapViewController = controller;
    }
    
    return self;
}

@end

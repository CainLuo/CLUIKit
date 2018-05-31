//
//  CLAMapViewModel.m
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLAMapViewModel.h"

@interface CLAMapViewModel ()

@property (nonatomic, weak, readwrite) CLAMapViewController *cl_aMapViewController;

@end

@implementation CLAMapViewModel

- (instancetype)initAMapViewModelWithController:(CLAMapViewController *)controller {
    
    if (self) {
        
        self.cl_aMapViewController = controller;
    }
    
    return self;
}

@end

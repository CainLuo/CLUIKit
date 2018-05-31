//
//  CLAMapDelegate.m
//  CLMapKitExmaple
//
//  Created by Cain Luo on 2018/5/29.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLAMapDelegate.h"

@interface CLAMapDelegate ()

@property (nonatomic, weak, readwrite) CLAMapViewModel *cl_aMapViewModel;

@end

@implementation CLAMapDelegate

- (instancetype)initAMapDelegateWithViewModel:(CLAMapViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_aMapViewModel = viewModel;
    }
    
    return self;
}

@end

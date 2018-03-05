//
//  EXApplicationController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/5.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXApplicationController.h"

@interface EXApplicationController ()

@end

@implementation EXApplicationController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.ex_textViewString appendString:@"----------查询权限----------\n"];
    [self.ex_textViewString appendFormat:@"是否开启定位权限: %@\n", [UIApplication cl_getApplicationLocationPermit] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"是否开启通信录权限: %@\n", [UIApplication cl_getApplicationAddressBookPermit] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"是否开启相机权限: %@\n", [UIApplication cl_getApplicationCameraPermit] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"是否开启推送权限: %@\n", [UIApplication cl_getApplicationRemindersPermit] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"是否开启相册权限: %@\n", [UIApplication cl_getApplicationPhotosLibraryPermit] ? @"YES" : @"NO"];
    
    [UIApplication cl_getApplicationMicrophonePermitWithBlock:^(BOOL granted) {
        
        [self.ex_textViewString appendFormat:@"是否开启麦克风权限: %@\n", granted ? @"YES" : @"NO"];
    }];
    
    [self ex_reloadTextView];
}

@end

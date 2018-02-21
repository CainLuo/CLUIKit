//
//  EXScanQRCodeController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXScanQRCodeController.h"

@interface EXScanQRCodeController () <CLScanQRCodeControllerDelegate>

@end

@implementation EXScanQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cl_scanQRCodeControllerDelegate = self;
    
    self.cl_autoStopCaptureSessionRunning = YES;
    
    [self cl_scanQRCodeBlock];
}

#pragma mark - CLScanQRCodeBlock
- (void)cl_scanQRCodeBlock {
    
    [self setCl_scanQRCodeGetMetadataObjectsBlock:^(NSArray *metadataObjects) {
        
        NSLog(@"扫描出来的结果为: %@", metadataObjects);
    }];
    
    [self setCl_scanQRCodeGetMetadataStringValue:^(NSString *stringValue) {
        
        NSLog(@"扫描出来的结果为: %@", stringValue);
    }];
}

#pragma mark - CLScanQRCodeDelegate
- (void)cl_scanQRCodeGetMetadataStringValue:(NSString *)metadataObject {
 
    NSLog(@"扫描出来的结果为: %@", metadataObject);
}

- (void)cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects {
    
    NSLog(@"扫描出来的结果为: %@", metadataObjects);
}

@end

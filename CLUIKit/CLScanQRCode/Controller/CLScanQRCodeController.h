//
//  CLScanQRCodeController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"
#import "CLScanQRCodeView.h"

@protocol CLScanQRCodeControllerDelegate <NSObject>

@optional
- (void)cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects;

- (void)cl_scanQRCodeGetMetadataStringValue:(NSString *)stringValue;

@end

@interface CLScanQRCodeController : CLViewController

@property (nonatomic, strong) CLScanQRCodeView *cl_scanQRCodeView;

/**
 Config Capture Session Running Auto Stop, Default: NO
 */
@property (nonatomic, assign) BOOL cl_autoStopCaptureSessionRunning;

@property (nonatomic, weak) id <CLScanQRCodeControllerDelegate> cl_scanQRCodeControllerDelegate;

#pragma mark - Block
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataObjectsBlock)(NSArray *metadataObjects);
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataStringValue)(NSString *stringValue);

- (void)cl_startCaptureSessionRunning;
- (void)cl_stopCaptureSessionRunning;

@end

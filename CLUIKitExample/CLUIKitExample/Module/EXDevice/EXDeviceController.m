//
//  EXDeviceController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDeviceController.h"

@interface EXDeviceController ()

@property (nonatomic, strong) UITextView *ex_textView;

@end

@implementation EXDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ex_addConstraintsWithSuperView];
    
    [self ex_changeTextFieldContent];
}

- (void)ex_changeTextFieldContent {
    
    NSMutableString *cl_mutableString = [[NSMutableString alloc] init];
    
    [cl_mutableString appendFormat:@"获取系统版本: %@\n", [UIDevice cl_getSystemVersion]];
    [cl_mutableString appendFormat:@"获取设备名: %@\n", [UIDevice cl_getDeviceName]];
    [cl_mutableString appendFormat:@"获取设备类型: %@\n", [UIDevice cl_getDeviceModelType]];
    [cl_mutableString appendFormat:@"获取设备的UDID: %@\n", [UIDevice cl_getUUIDString]];
    [cl_mutableString appendFormat:@"获取设备的型号: %@\n", [UIDevice cl_getCurrentDeviceModelName]];
    [cl_mutableString appendFormat:@"获取设备的CPU数量: %ld\n", [UIDevice cl_getCurrentDeviceCPUCount]];
    [cl_mutableString appendFormat:@"获取设备的CPU使用率: %f%%\n", [UIDevice cl_getCurrentDeviceAllCoreCPUUse] * 100.0];
    [cl_mutableString appendFormat:@"获取设备单个CPU使用率: %@\n", [UIDevice cl_getCurrentDeviceSingleCoreCPUUse]];
    [cl_mutableString appendFormat:@"获取设备网络运营商: %@\n", [UIDevice cl_getCarrierName]];
    [cl_mutableString appendFormat:@"获取设备网络类型: %@\n", [UIDevice cl_getCurrentRadioAccessTechnology]];
    [cl_mutableString appendFormat:@"获取设备IP地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddresses]];
    [cl_mutableString appendFormat:@"获取设备WiFi地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddressWithWiFi]];
    [cl_mutableString appendFormat:@"获取设备单元网络地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddressWithCell]];

    self.ex_textView.text = cl_mutableString;
}

- (UITextView *)ex_textView {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_textView);
    
    _ex_textView = [[UITextView alloc] init];
    
    _ex_textView.font = [UIFont systemFontOfSize:15];
    
    return _ex_textView;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_textView];
    
    [self.ex_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);

        } else {
            
            (void)make.top.bottom;
        }
        
        (void)make.left.right;
    }];
}

@end

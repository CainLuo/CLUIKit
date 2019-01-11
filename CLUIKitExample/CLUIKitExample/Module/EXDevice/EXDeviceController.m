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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"禁止右侧滑动返回");
    
    [self cl_setNavigationBarInteractivePopGestureRecognizerWithEnabled:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"可以右侧滑动返回");

    [self cl_setNavigationBarInteractivePopGestureRecognizerWithEnabled:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ex_addConstraintsWithSuperView];
    
    [self ex_changeTextFieldContent];
}

- (void)ex_changeTextFieldContent {
    
    NSMutableString *cl_mutableString = [[NSMutableString alloc] init];
    
    [cl_mutableString appendFormat:@"----------设备相关----------\n"];
    [cl_mutableString appendFormat:@"获取系统版本: %@\n", [UIDevice cl_getSystemVersion]];
    [cl_mutableString appendFormat:@"获取设备名: %@\n", [UIDevice cl_getDeviceName]];
    [cl_mutableString appendFormat:@"获取设备类型: %@\n", [UIDevice cl_getDeviceModelType]];
    [cl_mutableString appendFormat:@"获取设备的UDID: %@\n", [UIDevice cl_getUUIDString]];
    [cl_mutableString appendFormat:@"获取设备的型号: %@\n", [UIDevice cl_getCurrentDeviceModelName]];
    [cl_mutableString appendFormat:@"获取设备是否是iPad: %@\n", [UIDevice cl_isPad] ? @"YES" : @"NO"];
    [cl_mutableString appendFormat:@"获取设备是否是模拟器: %@\n", [UIDevice cl_isSimulator] ? @"YES" : @"NO"];
    [cl_mutableString appendFormat:@"获取设备是否是已越狱: %@\n", [UIDevice cl_isJailbroken] ? @"YES" : @"NO"];
    [cl_mutableString appendFormat:@"获取设备是否是X系列: %@\n", [UIDevice cl_isXDeviceModel] ? @"YES" : @"NO"];
    
    [cl_mutableString appendFormat:@"\n----------CPU相关----------\n"];
    [cl_mutableString appendFormat:@"获取设备的CPU数量: %lu\n", (unsigned long)[UIDevice cl_getCurrentDeviceCPUCount]];
    [cl_mutableString appendFormat:@"获取设备的CPU使用率: %f%%\n", [UIDevice cl_getCurrentDeviceAllCoreCPUUse] * 100.0];
    [cl_mutableString appendFormat:@"获取设备单个CPU使用率: %@\n", [UIDevice cl_getCurrentDeviceSingleCoreCPUUse]];
    
    [cl_mutableString appendFormat:@"\n----------网络相关----------\n"];
    [cl_mutableString appendFormat:@"获取Mac地址: %@\n", [UIDevice cl_getMacAddress]];
    [cl_mutableString appendFormat:@"获取设备网络运营商: %@\n", [UIDevice cl_getCarrierName]];
    [cl_mutableString appendFormat:@"获取设备网络类型: %@\n", [UIDevice cl_getCurrentRadioAccessTechnology]];
    [cl_mutableString appendFormat:@"获取设备IP地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddresses]];
    [cl_mutableString appendFormat:@"获取设备DNS服务器IP地址: %@\n", [UIDevice cl_getCurrentDNSServers]];
    [cl_mutableString appendFormat:@"获取设备WiFi地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddressWithWiFi]];
    [cl_mutableString appendFormat:@"获取设备单元网络地址: %@\n", [UIDevice cl_getCurrentDeviceIPAddressWithCell]];
    
    [cl_mutableString appendFormat:@"\n----------存储相关----------\n"];
    [cl_mutableString appendFormat:@"获取设备总存储大小: %ldByte\n", (long)[UIDevice cl_getDiskSpace]];
    [cl_mutableString appendFormat:@"获取设备可用存储大小: %ldByte\n", (long)[UIDevice cl_getDiskSpaceFree]];
    [cl_mutableString appendFormat:@"获取设备已用存储大小: %ldByte\n", (long)[UIDevice cl_getDiskSpaceUsed]];

    [cl_mutableString appendFormat:@"\n----------内存相关----------\n"];
    [cl_mutableString appendFormat:@"获取设备总内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryTotal]];
    [cl_mutableString appendFormat:@"获取设备可用内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryFree]];
    [cl_mutableString appendFormat:@"获取设备活跃中的内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryActive]];
    [cl_mutableString appendFormat:@"获取设备非活跃中的内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryInactive]];
    [cl_mutableString appendFormat:@"获取设备有线的内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryWired]];
    [cl_mutableString appendFormat:@"获取设备中可清除的内存大小: %ldByte\n", (long)[UIDevice cl_getMemoryPurgable]];


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

//
//  EXPickerViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXPickerViewModel.h"

@implementation EXPickerViewModel

- (void)ex_pickerViewModelRequest {
    
    for (NSInteger i = 0; i < 20; i++) {
        
        [self.cl_dataSource addObject:[NSString stringWithFormat:@"%ld", i]];
    }
    
    [self.cl_pickerController.cl_pickerView reloadAllComponents];
}

@end

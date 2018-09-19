//
//  EXPickerDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXPickerDelegate.h"

@implementation EXPickerDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UILabel *cl_pickerLabel = [[UILabel alloc] init];
    
    cl_pickerLabel.text          = self.cl_viewModel.cl_dataSource[row];
    cl_pickerLabel.textAlignment = NSTextAlignmentCenter;
    
    return cl_pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    NSLog(@"选中的Row: %ld, 选中的Component: %ld, 选中的内容: %@", row, component, self.cl_viewModel.cl_dataSource[row]);
}

@end

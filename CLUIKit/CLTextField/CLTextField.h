//
//  CLTextField.h
//  CLUIKit
//
//  Created by Cain on 2017/9/20.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLTextFieldType) {
    
    CLTextFieldBottomNormal = 0, // default
    CLTextFieldBottomLineType
};

@interface CLTextField : UITextField

/**
 CLTextFieldType, 默认为CLTextFieldBottomNormal
 */
@property (nonatomic, assign) CLTextFieldType cl_textFieldType;

/**
 CLTextField下划线的颜色, 只有在CLTextFieldBottomLineType下才会生效
 */
@property (nonatomic, strong) UIColor *cl_lineColor;

@end

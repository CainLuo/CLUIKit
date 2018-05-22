//
//  EXAlertBaseModel.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EXAlertType) {
    
    EXAlertTypePhone = 0,
    EXAlertTypeAlert,
    EXAlertTypeAlertSheet,
    EXAlertTypeCustom,
    EXAlertTypeCustomTitles
};

@interface EXAlertBaseModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) EXAlertType alertType;

@end

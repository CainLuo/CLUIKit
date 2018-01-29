//
//  CLTableViewCell.h
//  SimpleProject
//
//  Created by Cain on 2017/9/3.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLTableViewCellType) {
    
    CLTableViewCellBottomNormal = 0, // default
    CLTableViewCellBottomLineType
};

@interface CLTableViewCell : UITableViewCell

@property (nonatomic, assign) CLTableViewCellType cl_tableViewCellType;

@property (nonatomic, strong) UIColor *cl_lineColor;

@end

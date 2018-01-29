//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTitleView.h
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLTitleViewType) {
    
    CLTitleViewTitleType = 0, // Default
    CLTitleViewBackType,
    CLTitleViewCloseType,
    CLTitleViewShareType,
    CLTitleViewRightAloneType
};

@interface CLTitleView : UIView

/**
 Init CLTitlteView With Type
 
 @param titleViewType CLTitleViewType
 @return self
 */
- (instancetype)initCLTitleViewWithType:(CLTitleViewType)titleViewType;

/**
 Init CLTitlteView With Type
 
 @param frame CGRect
 @param titleViewType CLTitleViewType
 @return self
 */
- (instancetype)initCLTitleViewWithWithFrame:(CGRect)frame
                                        type:(CLTitleViewType)titleViewType;

@property (nonatomic, strong, readonly) UIButton *cl_leftButton;
@property (nonatomic, strong, readonly) UIButton *cl_rightButton;

/**
 Default CLTitleViewTitleType
 */
@property (nonatomic, assign) CLTitleViewType cl_titleViewType;

#pragma mark - Text Alignment
@property(nonatomic) NSTextAlignment cl_textAlignment;

#pragma mark - Title String
@property (nonatomic, copy) NSString *cl_titleString;

/**
 Default Font 17 Plain
 */
@property (nonatomic, assign) CGFloat cl_titleFont;

/**
 Default Black Color
 */
@property (nonatomic, strong) UIColor *cl_titleColor;

#pragma mark - Need Buttons
- (void)cl_needLeftButton;
- (void)cl_needRightButton;

#pragma mark - Change Buttons Image
- (void)cl_changeLeftButtonWithImageName:(NSString *)imageName
                          hightImageName:(NSString *)highImageName;

- (void)cl_changeRightButtonWithImageName:(NSString *)imageName
                           hightImageName:(NSString *)highImageName;

#pragma mark - Buttons Action
@property (nonatomic, copy) void(^cl_titleViewLeftButtonBlock)(UIButton *sender);
@property (nonatomic, copy) void(^cl_titleViewRightButtonBlock)(UIButton *sender);

@end

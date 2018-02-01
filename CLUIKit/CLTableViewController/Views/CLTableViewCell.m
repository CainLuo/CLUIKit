//
//  CLTableViewCell.m
//  SimpleProject
//
//  Created by Cain on 2017/9/3.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLTableViewCell.h"
#import "UIImage+CLImage.h"
#import "UIColor+CLColor.h"
#import "UIScreen+CLScreen.h"

@interface CLTableViewCell ()

@property (nonatomic, strong) UIImageView *cl_lineImageView;

@end

@implementation CLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self cl_addConstraintsWithSuperView];
    }
    
    return self;
}

- (void)setCl_tableViewCellType:(CLTableViewCellType)cl_tableViewCellType {
    
    _cl_tableViewCellType = cl_tableViewCellType;
}

- (void)setCl_lineColor:(UIColor *)cl_lineColor {
 
    self.cl_lineImageView.backgroundColor = cl_lineColor;
}

- (UIImageView *)cl_lineImageView {
    
    if (!_cl_lineImageView) {
        
        _cl_lineImageView = [[UIImageView alloc] init];
        
        _cl_lineImageView.backgroundColor = [UIColor cl_colorWithHex:0xf0f0f0];
        _cl_lineImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _cl_lineImageView;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self addSubview:self.cl_lineImageView];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rigthtConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:0
                                                                         constant:[UIScreen cl_fitScreen:1]];
    
    [self addConstraints:@[leftConstraint, bottomConstraint, rigthtConstraint, heightConstraint]];
}

@end

//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIButton+CLButton.m
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "UIButton+CLButton.h"
#import <objc/runtime.h>

@implementation UIButton (CLButton)

- (void)setCl_clickAreaEdgeInsets:(UIEdgeInsets)cl_clickAreaEdgeInsets {
    
    NSValue *value = [NSValue valueWithUIEdgeInsets:cl_clickAreaEdgeInsets];
    
    objc_setAssociatedObject(self, @selector(cl_clickAreaEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIEdgeInsets)cl_clickAreaEdgeInsets {
    
    NSValue *value = objc_getAssociatedObject(self, @selector(cl_clickAreaEdgeInsets));
    
    if (value) {
        
        UIEdgeInsets edgeInset = [value UIEdgeInsetsValue];
        
        return edgeInset;
    }
    
    return UIEdgeInsetsZero;
}

- (BOOL)pointInside:(CGPoint)point
          withEvent:(UIEvent *)event {
    
    if (UIEdgeInsetsEqualToEdgeInsets(self.cl_clickAreaEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        
        return [super pointInside:point
                        withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.cl_clickAreaEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - 倒计时方法
- (void)cl_startButtonWithTime:(NSInteger)time {
    
    [self cl_startButtonWithTime:time
                           title:self.titleLabel.text
                     suffixTitle:@""
                     normalColor:self.backgroundColor
                     timingColor:self.backgroundColor];
}

- (void)cl_startButtonWithTime:(NSInteger)time
                   normalImage:(UIImage *)normalImage
                  disableImage:(UIImage *)disableImage {

    [self cl_startButtonWithTime:time
                           title:self.titleLabel.text
                     suffixTitle:@""
                     normalColor:self.backgroundColor
                     timingColor:self.backgroundColor
                    disableImage:disableImage
                     normalImage:normalImage];
}

- (void)cl_startButtonWithTime:(NSInteger)time
                         title:(NSString *)title
                   suffixTitle:(NSString *)suffixTitle
                   normalColor:(UIColor *)normalColor
                   timingColor:(UIColor *)timingColor {
    
    [self cl_startButtonWithTime:time
                           title:self.titleLabel.text
                     suffixTitle:@""
                     normalColor:self.backgroundColor
                     timingColor:self.backgroundColor
                    disableImage:[[UIImage alloc] init]
                     normalImage:[[UIImage alloc] init]];
}

- (void)cl_startButtonWithTime:(NSInteger)time
                         title:(NSString *)title
                   suffixTitle:(NSString *)suffixTitle
                   normalColor:(UIColor *)normalColor
                   timingColor:(UIColor *)timingColor
                  disableImage:(UIImage *)disableImage
                   normalImage:(UIImage *)normalImage {
    
    //倒计时时间
    __block NSInteger timeOut = time;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self setBackgroundImage:normalImage
                                forState:UIControlStateNormal];
                
                self.backgroundColor = normalColor;
                
                [self setTitle:title
                      forState:UIControlStateNormal];
                [self setTitleColor:[UIColor whiteColor]
                           forState:UIControlStateNormal];
                self.enabled = YES;
            });
            
        } else {
            
            NSInteger allTime = (NSInteger)time + 1;
            NSInteger seconds = timeOut % allTime;
            
            NSString *timeString = [NSString stringWithFormat:@"%ld", (long)seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = timingColor;
                
                [self setBackgroundImage:disableImage
                                forState:UIControlStateNormal];
                [self setTitleColor:[UIColor blackColor]
                           forState:UIControlStateNormal];
                [self setTitle:[NSString stringWithFormat:@"%@%@", timeString, suffixTitle]
                      forState:UIControlStateNormal];
                
                self.enabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}

@end

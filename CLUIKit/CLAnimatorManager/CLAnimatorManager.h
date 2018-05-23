//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLAnimatorManager.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CLAnimatorManagerBlock)(void);
typedef void(^CLAnimatorManagerCompleteBlock)(UIViewAnimatingPosition finalPosition);
typedef void(^CLAnimatorManagerStatusBlock)(UIViewAnimatingState state);

NS_CLASS_AVAILABLE_IOS(10_0) @interface CLAnimatorManager : NSObject

@property (nonatomic, strong, readonly) UIViewPropertyAnimator *cl_viewPropertyAnimator;

#pragma mark - UICubicTimingParameters
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve NS_AVAILABLE_IOS(10_0);

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2 NS_AVAILABLE_IOS(10_0);

#pragma mark - UISpringTimingParameters
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity NS_AVAILABLE_IOS(10_0);

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity;

#pragma mark - UIViewPropertyAnimator
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                   complete:(CLAnimatorManagerBlock)complete NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                   complete:(CLAnimatorManagerBlock)complete NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                   complete:(CLAnimatorManagerBlock)complete NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(CLAnimatorManagerBlock)animations
                                   complete:(CLAnimatorManagerCompleteBlock)complete NS_AVAILABLE_IOS(10_0);

- (void)cl_viewPropertyAnimatorAddnimationsWithDelayFactor:(NSTimeInterval)delayFactor
                                                  complete:(CLAnimatorManagerStatusBlock)complete NS_AVAILABLE_IOS(10_0);

#pragma mark - UIViewPropertyAnimator控制相关
- (void)cl_starViewPropertyAnimator;

- (void)cl_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay;

- (void)cl_pauseViewPropertyAnimator;

- (void)cl_stopViewPropertyAnimator:(BOOL)stop;

- (void)cl_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position;

@end
NS_ASSUME_NONNULL_END

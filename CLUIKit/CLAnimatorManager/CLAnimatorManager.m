//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLAnimatorManager.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLAnimatorManager.h"

@interface CLAnimatorManager ()

@property (nonatomic, strong, readwrite) UIViewPropertyAnimator *cl_viewPropertyAnimator;

@end

@implementation CLAnimatorManager

#pragma mark - UICubicTimingParameters
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve {
    
    UICubicTimingParameters *cl_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithAnimationCurve:curve];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_cubicTimingParameters];
}

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2 {
    
    UICubicTimingParameters *cl_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithControlPoint1:controlPoint1
                                                                                                 controlPoint2:controlPoint2];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_cubicTimingParameters];
}

#pragma mark - UISpringTimingParameters
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio
                                                                                                 initialVelocity:velocity];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithMass:mass
                                                                                               stiffness:stiffness
                                                                                                 damping:damping
                                                                                         initialVelocity:velocity];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
}

#pragma mark - UIViewPropertyAnimator
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:parameters];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                   complete:(CLAnimatorManagerBlock)complete {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                              curve:curve
                                                                         animations:complete];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                   complete:(CLAnimatorManagerBlock)complete {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                      controlPoint1:point1
                                                                      controlPoint2:point2
                                                                         animations:complete];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                   complete:(CLAnimatorManagerBlock)complete {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                       dampingRatio:ratio
                                                                         animations:complete];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(CLAnimatorManagerBlock)animations
                                   complete:(CLAnimatorManagerCompleteBlock)complete {
    
    self.cl_viewPropertyAnimator = [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:duration
                                                                                         delay:delay
                                                                                       options:options
                                                                                    animations:animations
                                                                                    completion:complete];
}

- (void)cl_viewPropertyAnimatorAddnimationsWithDelayFactor:(NSTimeInterval)delayFactor
                                                  complete:(CLAnimatorManagerStatusBlock)complete {
    
    __weak __typeof(&*self)weakSelf = self;
    
    if (self.cl_viewPropertyAnimator) {
        
        [self.cl_viewPropertyAnimator addAnimations:^{
            
            if (complete) {
                
                complete(weakSelf.cl_viewPropertyAnimator.state);
            }
        }
                                        delayFactor:delayFactor];
    }
}

#pragma mark - UIViewPropertyAnimator控制相关
- (void)cl_starViewPropertyAnimator {
    
    [self.cl_viewPropertyAnimator startAnimation];
}

- (void)cl_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay {
    
    [self.cl_viewPropertyAnimator startAnimationAfterDelay:delay];
}

- (void)cl_pauseViewPropertyAnimator {
    
    [self.cl_viewPropertyAnimator pauseAnimation];
}

- (void)cl_stopViewPropertyAnimator:(BOOL)stop {
    
    [self.cl_viewPropertyAnimator stopAnimation:stop];
}

- (void)cl_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position {
    
    [self.cl_viewPropertyAnimator finishAnimationAtPosition:position];
}

@end

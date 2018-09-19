//
//  EXPresentationController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/6/26.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXPresentationController.h"
#import "EXPresentationTransitioningDelegate.h"

@interface EXPresentationController ()

@property (nonatomic, strong) EXPresentationTransitioningDelegate *ex_presentationTransitioningDelegate;

@end

@implementation EXPresentationController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate     = self.ex_presentationTransitioningDelegate;
        self.modalPresentationStyle    = UIModalPresentationCustom;
        self.cl_presentationViewHeight = 200;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cl_getARC4RandomColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (EXPresentationTransitioningDelegate *)ex_presentationTransitioningDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_presentationTransitioningDelegate);
    
    _ex_presentationTransitioningDelegate = [[EXPresentationTransitioningDelegate alloc] initViewControllerTransitioningDelegateWithController:self];
    
    return _ex_presentationTransitioningDelegate;
}

@end

//
//  EXPresentationController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/6/26.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXPresentationController.h"

@interface EXPresentationController ()

@end

@implementation EXPresentationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cl_getARC4RandomColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end

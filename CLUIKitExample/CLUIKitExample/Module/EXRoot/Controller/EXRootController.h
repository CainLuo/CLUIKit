//
//  EXRootController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLTableViewController.h"
#import "EXRootTransitioningDelegate.h"

@interface EXRootController : CLTableViewController

@property (nonatomic, strong, readonly) EXRootTransitioningDelegate *ex_rootTransitioningDelegate;

@end

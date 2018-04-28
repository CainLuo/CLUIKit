//
//  EXScrollViewDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXScrollViewDelegate.h"

@implementation EXScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"UIScrollView: %@, ViewModel: %@", scrollView, self.cl_scrollViewViewModel);
}

@end

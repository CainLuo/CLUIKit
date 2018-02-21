//
//  EXCollectionViewDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXCollectionViewDelegate.h"

@implementation EXCollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了第%ld条Cell", indexPath.row);
}

- (UIView *)cl_placeholderView {
    
    UIView *cl_placeholderView = [[UIView alloc] init];
    
    cl_placeholderView.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return cl_placeholderView;
}

@end

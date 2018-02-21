//
//  EXCollectionViewDataSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXCollectionViewDataSource.h"

@implementation EXCollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *ex_collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell"
                                                                                            forIndexPath:indexPath];
    
    ex_collectionViewCell.backgroundColor = [UIColor cl_getARC4RandomColor];
    
    return ex_collectionViewCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    
        UICollectionReusableView *ex_collectionReusableHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                                       withReuseIdentifier:@"UICollectionElementKindSectionHeader"
                                                                                                              forIndexPath:indexPath];

        if (!ex_collectionReusableHeaderView) {
            
            ex_collectionReusableHeaderView = [[UICollectionReusableView alloc] init];
        }
        
        ex_collectionReusableHeaderView.backgroundColor = [UIColor cl_getARC4RandomColor];
        
        return ex_collectionReusableHeaderView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
        UICollectionReusableView *ex_collectionReusableFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                                       withReuseIdentifier:@"UICollectionElementKindSectionFooter"
                                                                                                              forIndexPath:indexPath];
        
        if (!ex_collectionReusableFooterView) {
            
            ex_collectionReusableFooterView = [[UICollectionReusableView alloc] init];
        }
        
        ex_collectionReusableFooterView.backgroundColor = [UIColor cl_getARC4RandomColor];
        
        return ex_collectionReusableFooterView;
    }
    
    return nil;
}

@end

//
//  EXCollectionViewViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXCollectionViewViewModel.h"

@implementation EXCollectionViewViewModel

- (void)cl_collectionViewHTTPRequest {
    
    if (self.cl_dataSource.count) {
        
        [self.cl_dataSource removeAllObjects];
        
        [self.cl_collectionViewController.cl_collectionView cl_reloadData];
        
        [self.cl_collectionViewController cl_dropDownEndRefresh];
        [self.cl_collectionViewController cl_pullUpEndRefresh];

    } else {

        for (NSInteger i = 0; i < 10; i++) {
            
            [self.cl_dataSource addObject:[NSString stringWithFormat:@"%ld", i]];
        }
        
        [self.cl_collectionViewController.cl_collectionView cl_reloadData];
        
        [self.cl_collectionViewController cl_dropDownEndRefresh];
        [self.cl_collectionViewController cl_pullUpEndRefresh];
    }
}

@end

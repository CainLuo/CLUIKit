//
//  CLCollectionViewDragDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDragDelegate.h"

@interface CLCollectionViewDragDelegate ()

@property (nonatomic, weak, readwrite) CLCollectionViewViewModel *cl_viewModel;

@end

@implementation CLCollectionViewDragDelegate

- (instancetype)initCollectionViewDragDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (nonnull NSArray<UIDragItem *> *)collectionView:(nonnull UICollectionView *)collectionView
                     itemsForBeginningDragSession:(nonnull id<UIDragSession>)session
                                      atIndexPath:(nonnull NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)) {
    
    return nil;
}

@end

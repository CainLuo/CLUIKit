//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewController.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLCollectionViewController : CLViewController

@property (nonatomic, strong, readonly) UICollectionView *cl_collectionView;
@property (nonatomic, strong, readonly) UICollectionViewFlowLayout *cl_collectionViewFlowLayout;

- (void)cl_removeRefresh;
- (void)cl_removeHeaderRefresh;
- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;
- (void)cl_pullUpRefresh;

- (void)cl_dropDownBeginRefresh;
- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpBeginRefresh;
- (void)cl_pullUpEndRefresh;

- (void)cl_setCollectionViewDelegate:(_Nullable id <UICollectionViewDelegate>)delegate
                          dataSource:(_Nullable id <UICollectionViewDataSource>)dataSource;

- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier;

@end
NS_ASSUME_NONNULL_END

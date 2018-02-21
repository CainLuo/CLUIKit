//
//  EXCollectionViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXCollectionViewController.h"
#import "EXCollectionViewDataSource.h"
#import "EXCollectionViewDelegate.h"
#import "EXCollectionViewViewModel.h"

@interface EXCollectionViewController ()

@property (nonatomic, strong) EXCollectionViewDataSource *ex_collectionViewDataSource;
@property (nonatomic, strong) EXCollectionViewDelegate   *ex_collectionViewDelegate;
@property (nonatomic, strong) EXCollectionViewViewModel  *ex_collectionViewViewModel;

@end

@implementation EXCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self cl_setCollectionViewDelegate:self.ex_collectionViewDelegate
                            dataSource:self.ex_collectionViewDataSource];
    
    [self.cl_collectionView registerClass:[UICollectionViewCell class]
               forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.cl_collectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                      withReuseIdentifier:@"UICollectionElementKindSectionHeader"];
    [self.cl_collectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                      withReuseIdentifier:@"UICollectionElementKindSectionFooter"];
    
    [self.cl_collectionView cl_reloadData];

    [self cl_configCollectionViewFlowLayout];

    [self cl_dropDownBeginRefresh];    
}

- (void)cl_dropDownRefresh {
    
    [self.ex_collectionViewViewModel cl_collectionViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self.ex_collectionViewViewModel cl_collectionViewHTTPRequest];
}

- (EXCollectionViewDataSource *)ex_collectionViewDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_collectionViewDataSource);
    
    _ex_collectionViewDataSource = [[EXCollectionViewDataSource alloc] initCollectionViewDataSourceWithViewModel:self.ex_collectionViewViewModel];
    
    return _ex_collectionViewDataSource;
}

- (EXCollectionViewDelegate *)ex_collectionViewDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_collectionViewDelegate);
    
    _ex_collectionViewDelegate = [[EXCollectionViewDelegate alloc] initCollectionViewDelegateWithViewModel:self.ex_collectionViewViewModel];
    
    return _ex_collectionViewDelegate;
}

- (EXCollectionViewViewModel *)ex_collectionViewViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_collectionViewViewModel);
    
    _ex_collectionViewViewModel = [[EXCollectionViewViewModel alloc] initCollectionViewBaseModelWithController:self];
    
    return _ex_collectionViewViewModel;
}

- (void)cl_configCollectionViewFlowLayout {
    
    self.cl_collectionViewFlowLayout.itemSize                = CGSizeMake([UIScreen cl_getScreenWidth] / 5, 50);
    self.cl_collectionViewFlowLayout.minimumLineSpacing      = 10;
    self.cl_collectionViewFlowLayout.minimumInteritemSpacing = 0;

    self.cl_collectionViewFlowLayout.headerReferenceSize = CGSizeMake(0, 50);
    self.cl_collectionViewFlowLayout.footerReferenceSize = CGSizeMake(0, 50);
}

@end

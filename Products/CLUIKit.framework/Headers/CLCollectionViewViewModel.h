//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewBaseModel.h
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLCollectionViewController.h"

@interface CLCollectionViewViewModel : NSObject

@property (nonatomic, weak, readonly) CLCollectionViewController *cl_collectionViewController;
@property (nonatomic, strong) NSMutableArray *cl_dataSource;

- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController;

- (void)cl_collectionViewHTTPRequest;

@end

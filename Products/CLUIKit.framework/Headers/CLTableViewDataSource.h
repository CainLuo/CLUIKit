//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDataSource.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewViewModel.h"

@interface CLTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

- (instancetype)initTableViewDataSourceWithViewModel:(CLTableViewViewModel *)viewModel;

@end

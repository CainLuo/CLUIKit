//
//  EXImageController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXImageController.h"

@interface EXImageController ()

@property (nonatomic, strong) UIImageView *ex_imageView;

@property (nonatomic, strong) UIButton *ex_imageButton;


@end

@implementation EXImageController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (UIImageView *)ex_imageView {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_imageView);
    
    _ex_imageView = [[UIImageView alloc] init];
    
    _ex_imageView.contentMode     = UIViewContentModeScaleAspectFit;
    _ex_imageView.backgroundColor = [UIColor cl_colorWithHex:0xd8d8d8];
    
    return _ex_imageView;
}

- (UIButton *)ex_imageButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_imageButton);
    
    _ex_imageButton = [[UIButton alloc] init];
    
    _ex_imageButton.backgroundColor = [UIColor cl_colorWithHex:0x2e7ae6];
    
    [_ex_imageButton setTitle:@"设置图片"
                     forState:UIControlStateNormal];
    [_ex_imageButton addTarget:self
                        action:@selector(ex_imageButtonAction:)
              forControlEvents:UIControlEventTouchUpInside];
    
    return _ex_imageButton;
}

- (void)ex_imageButtonAction:(UIButton *)sender {
    
    NSArray *ex_sheetArray = @[@"生成指定颜色的图片",
                               @"截取指定UIView的图片",
                               @"设置指定尺寸的图片",
                               @"加载GIF图片",
                               @"创建二维码",
                               @"创建条形码",
                               @"添加高斯模糊",
                               @"给图片添加圆角",
                               @"给图片添加颜色和圆角",
                               @"获取重置Size的图片",
                               @"获取指定最长边的UIImage Size"];
    
    [self cl_showSheetViewControllerWithTitle:@"设置图片"
                                      message:@"设置您的图片"
                                 actionTitles:ex_sheetArray
                                      handler:^(UIAlertAction *action, NSUInteger index) {
        
                                          [self ex_changeImageViewWithIndex:index];
                                      }];
}

- (void)ex_changeImageViewWithIndex:(NSUInteger)index {
    
    switch (index) {
        case 0: {
            
            [UIImage cl_asyncGetImageWithColor:[UIColor cl_getARC4RandomColor]
                                    completion:^(UIImage *image) {
                
                                        self.ex_imageView.image = image;
                                    }];
            
        }
            break;
        case 1: {
            
            self.ex_imageView.image = [UIImage cl_getImageForView:self.view];
        }
            break;
        case 2: {
            
            [UIImage cl_asyncDrawImageToSize:CGSizeMake(100, 100)
                                       image:[UIImage imageNamed:@"icon1"]
                                  completion:^(UIImage *image) {
                
                                      self.ex_imageView.image = image;
                                  }];            
        }
            break;
            
        case 3: {
            
            [UIImage cl_asyncLoadGIFImageForName:@"gif"
                                      completion:^(UIImage *image) {
                
                                          self.ex_imageView.image = image;
                                      }];
        }
            
            break;
        case 4: {
            
            [UIImage cl_asyncCreateQRCodeImageWithString:@"欢迎使用CLUIKit"
                                               logoImage:[UIImage imageNamed:@"icon1"]
                                              completion:^(UIImage *image) {

                                                  self.ex_imageView.image = image;
                                              }];
        }
            break;
        case 5: {
            
            [UIImage cl_asyncCreate128BarcodeImageWithString:@"6914068000138"
                                                  completion:^(UIImage *image) {
                
                                                      self.ex_imageView.image = image;
                                                  }];
        }
            break;
        case 6: {
            
            [UIImage cl_asyncBlurImageWithBlur:0.5
                                         image:[UIImage imageNamed:@"1"]
                                    completion:^(UIImage *image) {
                                        
                                        self.ex_imageView.image = image;
                                    }];
        }
            break;
        case 7: {
            
            [UIImage cl_asyncCornerImageWithRadius:50
                                             image:[UIImage imageNamed:@"1"]
                                        completion:^(UIImage *image) {
                                        
                                        self.ex_imageView.image = image;
                                    }];
        }
            break;
        case 8: {
            
            [UIImage cl_asyncGetImageWithColor:[UIColor redColor]
                                        radius:50
                                    completion:^(UIImage *image) {
                
                                        self.ex_imageView.image = image;
                                    }];
        }
            break;
        case 9: {
            
            [UIImage cl_resetSizeWithImage:[UIImage imageNamed:@"1"]
                                      size:CGSizeMake(20, 20)
                                completion:^(UIImage *image) {
                
                                    self.ex_imageView.image = image;
                                }];
            
        }
            break;

        case 10: {
            
            UIImage *cl_image = [UIImage imageNamed:@"dog"];
            
            CGSize cl_iamgeSize = [UIImage cl_getScaleImageWithImage:cl_image
                                                              length:200];
            
            [UIImage cl_resetSizeWithImage:cl_image
                                      size:cl_iamgeSize
                                completion:^(UIImage *image) {
                                    
                                    self.ex_imageView.image = image;
                                }];
            
            NSLog(@"UIImage 的比例为: %@", NSStringFromCGSize(cl_iamgeSize));
        }
            break;
        default:
            break;
    }
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_imageView];
    [self.view addSubview:self.ex_imageButton];
    
    [self.ex_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            (void)make.top;
        }
        
        (void)make.left.right;
        make.height.mas_equalTo(CGRectGetWidth(self.view.frame));
    }];
    
    [self.ex_imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            (void)make.bottom;
        }

        (void)make.left.right;
        make.height.mas_equalTo([UIScreen cl_fitScreen:100]);
    }];
}

@end

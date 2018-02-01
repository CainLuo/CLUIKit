//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImage+CLImage.h
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLImage)(UIImage *image);

@interface UIImage (CLImage)

#pragma mark - 生成指定颜色图片
/**
 根据给定的颜色异步生成一张图
 
 @param color UIColor
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                       completion:(CLImage)completion;

/**
 根据给定的颜色异步生成一张图

 @param color UIColor
 @param rect 指定大小
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(CLImage)completion;

#pragma mark - 截取指定视图大小的截图
/**
 截取指定视图大小的截图

 @param view 指定视图
 @param completion 回调
 */
+ (void)cl_asyncGetImageForView:(UIView *)view
                     completion:(CLImage)completion;

#pragma mark - 缩放指定比例的图片
/**
 给指定图片绘制指定大小

 @param size Size
 @param image 图片
 @param completion 回调
 */
+ (void)cl_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(CLImage)completion;

#pragma mark - 加载GIF图片
/**
 加载指定名称的GIF图片
 
 @param name 图片名
 @param completion 回调
 */
+ (void)cl_asyncLoadGIFImageForName:(NSString *)name
                         completion:(CLImage)completion;

/**
 从NSData里加载GIF图片
 
 @param data 图片数据
 @param completion 回调
 */
+ (void)cl_asyncLoadGIFImageWithData:(NSData *)data
                          completion:(CLImage)completion;

#pragma mark - 生成二维码
/**
 异步创建一个二维码
 
 @param string 二维码的内容
 @param completion 回调
 */
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(CLImage)completion;

/**
 创建一个二维码, 且可以添加中间的Logo图
 
 @param string 二维码内容
 @param logoName logo图 default size is 150 * 150
 @param completion 回调
 */
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                       logo:(NSString *)logoName
                                 completion:(CLImage)completion;
#pragma mark - 生成条形码
/**
 创建一个条形码
 
 @param string 条形码内容, 只能输入ASCII字符
 @return UIImage
 */
- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string;

/**
 创建一个条形码, 并且可以设置条形码与UIImageView两边的间距
 
 @param string 条形码内容, 只能输入ASCII字符
 @param space 与UIImageView两边的距离
 @return UIImage
 */
- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string
                                          space:(CGFloat)space;

#pragma mark - 获取指定Bundle文件里的图片
/**
 从指定的Bundle包里获取对应的图片

 @param bundle 资源包
 @param imageName 图片名
 @return UIImage
 */
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName;

#pragma mark - 图片高斯模糊处理
/**
 输入一张图片, 返回一张带高斯模糊的图片

 @param blur 模糊值
 @param image 指定的图片
 @param completion 回调
 */
+ (void)cl_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(CLImage)completion;

#pragma mark - 图片圆角处理
/**
 给指定的图片添加圆角效果

 @param radius 弧度
 @param image 指定的图片
 @param completion 回调
 */
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(CLImage)completion;

/**
 给指定的图片增加圆角,边框, 边框的颜色.

 @param radius 弧度
 @param image 指定的图片
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @param completion 回调
 */
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(CLImage)completion;
@end

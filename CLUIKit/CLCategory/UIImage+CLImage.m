//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImage+CLImage.m
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "UIImage+CLImage.h"
#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage (CLImage)

#pragma mark - 生成指定颜色图片
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                       completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
        
        image = [UIImage imageWithData:imageData];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(image);
            }
        });
    });
}

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
        
        image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(image);
            }
        });
    });
}

#pragma mark - 截取指定视图大小的截图
+ (void)cl_asyncGetImageForView:(UIView *)view
                     completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
        
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage *imageRet = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();

        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion(imageRet);
        });
    });
}

#pragma mark - 缩放指定比例的图片
+ (void)cl_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        UIImage *drawImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(drawImage);
            }
        });
    });
}

#pragma mark - 加载GIF图片
+ (void)cl_asyncLoadGIFImageForName:(NSString *)name
                         completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGFloat scale = [UIScreen mainScreen].scale;
        
        if (scale > 1.0f) {
            
            NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"]
                                                                   ofType:@"gif"];
            
            NSData *data = [NSData dataWithContentsOfFile:retinaPath];

            if (completion) {

                if (data) {
                    
                    [UIImage cl_asyncLoadGIFImageWithData:data
                                               completion:^(UIImage *image) {
                                                   
                                                   completion(image);
                                               }];
                }
            }
            
            NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                             ofType:@"gif"];
            
            data = [NSData dataWithContentsOfFile:path];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                if (completion) {

                    if (data) {
                        
                        [UIImage cl_asyncLoadGIFImageWithData:data
                                                   completion:^(UIImage *image) {
                                                       
                                                       completion(image);
                                                   }];
                        
                        return;
                    }
                    
                    completion([UIImage imageNamed:name]);
                }
            });
            
        } else {
            
            NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                             ofType:@"gif"];
            
            NSData *data = [NSData dataWithContentsOfFile:path];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                if (completion) {
                    
                    if (data) {
                        
                        [UIImage cl_asyncLoadGIFImageWithData:data
                                                   completion:^(UIImage *image) {
                            
                                                       completion(image);
                                                   }];
                    }
                    
                    completion([UIImage imageNamed:name]);
                }
            });
        }
    });
}

+ (void)cl_asyncLoadGIFImageWithData:(NSData *)data
                          completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (!data) {
            return;
        }
        
        //获取数据源
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data,
                                                              NULL);
        
        // 获取图片数量(如果传入的是gif图的二进制，那么获取的是图片帧数)
        size_t count = CGImageSourceGetCount(source);
        
        UIImage *animatedImage;
        
        if (count <= 1) {
            animatedImage = [[UIImage alloc] initWithData:data];
            
        } else {
            
            NSMutableArray *images = [NSMutableArray array];
            
            NSTimeInterval duration = 0.0f;
            
            for (size_t i = 0; i < count; i++) {
                
                CGImageRef image = CGImageSourceCreateImageAtIndex(source,
                                                                   i,
                                                                   NULL);
                
                duration += [self cl_frameDurationAtIndex:i
                                                   source:source];
                
                [images addObject:[UIImage imageWithCGImage:image
                                                      scale:[UIScreen mainScreen].scale
                                                orientation:UIImageOrientationUp]];
                
                CGImageRelease(image);
            }
            
            // 如果上面的计算播放时间方法没有成功，就按照下面方法计算
            // 计算一次播放的总时间：每张图播放1/10秒 * 图片总数
            if (!duration) {
                duration = (1.0f / 10.0f) * count;
            }
            
            animatedImage = [UIImage animatedImageWithImages:images
                                                    duration:duration];
        }
        
        CFRelease(source);

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(animatedImage);
            }
        });
    });
}

/**
 计算GIF图片播放的时间

 @param index 索引
 @param source 图片内容
 @return 计算时间
 */
+ (CGFloat)cl_frameDurationAtIndex:(NSUInteger)index
                            source:(CGImageSourceRef)source {
    
    CGFloat frameDuration = 0.1f;
    
    // 获取这一帧的属性字典
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source,
                                                                           index,
                                                                           nil);
    
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    // 从字典中获取这一帧持续的时间
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    
    if (delayTimeUnclampedProp) {
        
        frameDuration = [delayTimeUnclampedProp floatValue];
        
    } else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        
        if (delayTimeProp) {
            
            frameDuration = [delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (frameDuration < 0.011f) {
        
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    
    return frameDuration;
}

#pragma mark - 异步生成一个二维码
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        CIFilter *QRCodeImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        
        [QRCodeImageFilter setDefaults];
        
        NSData *QRCodeImageData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        [QRCodeImageFilter setValue:QRCodeImageData
                             forKey:@"inputMessage"];
        [QRCodeImageFilter setValue:@"H"
                             forKey:@"inputCorrectionLevel"];
        
        CIImage *QRCodeCIImage = [QRCodeImageFilter outputImage];
        
        QRCodeCIImage = [QRCodeCIImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
        
        UIImage *QRCodeUIImage = [UIImage imageWithCIImage:QRCodeCIImage];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(QRCodeUIImage);
            }
        });
    });
}

+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                       logo:(NSString *)logoName
                                 completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        __block UIImage *QRCodeImage = [[UIImage alloc] init];
        
        [self cl_asyncCreateQRCodeImageWithString:string
                                       completion:^(UIImage *image) {
                                              
                                           QRCodeImage = image;
                                       }];
        
        UIGraphicsBeginImageContext(QRCodeImage.size);
        
        [QRCodeImage drawInRect:CGRectMake(0,
                                           0,
                                           QRCodeImage.size.width,
                                           QRCodeImage.size.height)];
        
        UIImage *sImage = [UIImage imageNamed:logoName];
        
        CGFloat sImageW = 150;
        CGFloat sImageH = sImageW;
        CGFloat sImageX = (QRCodeImage.size.width - sImageW) * 0.5;
        CGFloat sImgaeY = (QRCodeImage.size.height - sImageH) * 0.5;
        
        [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
        
        UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(finalyImage);
            }
        });
    });
}

#pragma mark - 生成条形码
- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string {
    
    return [self cl_create128BarcodeImageWithString:string
                                              space:7];
}

- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string
                                          space:(CGFloat)space {
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    NSData *contentData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    [qrFilter setValue:contentData
                forKey:@"inputMessage"];
    [qrFilter setValue:@(space)
                forKey:@"inputQuietSpace"];
    
    CIImage *barCodeImage = qrFilter.outputImage;
    
    barCodeImage = [barCodeImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    
    UIImage *barCodeUIImage = [UIImage imageWithCIImage:barCodeImage];
    
    return barCodeUIImage;
} 

#pragma mark - 获取指定Bundle文件里的图片
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName {
    
    NSBundle *mainBundle = [NSBundle bundleForClass:NSClassFromString(bundle)];
    
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:bundle
                                                                              ofType:@"bundle"]];
    
    if (!resourcesBundle) {
        
        resourcesBundle = mainBundle;
    }
    
    UIImage *image = [UIImage imageNamed:imageName
                                inBundle:resourcesBundle
           compatibleWithTraitCollection:nil];
    
    return image;
}

#pragma mark - 图片高斯模糊处理
+ (void)cl_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(CLImage)completion {
    
    __block CGFloat blurValue = blur;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *imageData  = UIImageJPEGRepresentation(image, 1); // convert to jpeg
        UIImage *destImage = [UIImage imageWithData:imageData];
        
        if (blurValue < 0.f || blurValue > 1.f) {
            blurValue = 0.5f;
        }
        
        int boxSize = (int)(blur * 40);
        
        boxSize = boxSize - (boxSize % 2) + 1;
        
        CGImageRef img = destImage.CGImage;
        
        vImage_Buffer inBuffer, outBuffer;
        
        vImage_Error error;
        
        void *pixelBuffer;
        
        //create vImage_Buffer with data from CGImageRef
        
        CGDataProviderRef inProvider = CGImageGetDataProvider(img);
        CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
        
        inBuffer.width    = CGImageGetWidth(img);
        inBuffer.height   = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
        
        //create vImage_Buffer for output
        
        pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        
        if(pixelBuffer == NULL) {
            
            NSLog(@"No pixelbuffer");
        }
        
        outBuffer.data     = pixelBuffer;
        outBuffer.width    = CGImageGetWidth(img);
        outBuffer.height   = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        // Create a third buffer for intermediate processing
        void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        
        vImage_Buffer outBuffer2;
        
        outBuffer2.data     = pixelBuffer2;
        outBuffer2.width    = CGImageGetWidth(img);
        outBuffer2.height   = CGImageGetHeight(img);
        outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
        
        //perform convolution
        error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                           &outBuffer2,
                                           NULL,
                                           0,
                                           0,
                                           boxSize,
                                           boxSize,
                                           NULL,
                                           kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        
        error = vImageBoxConvolve_ARGB8888(&outBuffer2,
                                           &inBuffer,
                                           NULL,
                                           0,
                                           0,
                                           boxSize,
                                           boxSize,
                                           NULL,
                                           kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                           &outBuffer,
                                           NULL,
                                           0,
                                           0,
                                           boxSize,
                                           boxSize,
                                           NULL,
                                           kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
        
        CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
        
        free(pixelBuffer);
        free(pixelBuffer2);
        CFRelease(inBitmapData);
        
        CGImageRelease(imageRef);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(returnImage);
            }
        });
    });
}

#pragma mark - 图片圆角处理
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(CLImage)completion {
    
    [UIImage cl_asyncCornerImageWithRadius:radius
                                     image:image
                               borderWidth:0
                               borderColor:nil
                                completion:completion];
}

+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(CLImage)completion {
    
    [UIImage cl_asyncCornerImageWithRadius:radius
                                     image:image
                                   corners:UIRectCornerAllCorners
                               borderWidth:borderWidth
                               borderColor:borderColor
                            borderLineJoin:kCGLineJoinMiter
                                completion:completion];
}

+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin
                           completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        
        CGContextScaleCTM(context, 1, -1);
        
        CGContextTranslateCTM(context, 0, -rect.size.height);
        
        CGFloat minSize = MIN(image.size.width, image.size.height);
        
        if (borderWidth < minSize / 2) {
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth)
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, borderWidth)];
            [path closePath];
            
            CGContextSaveGState(context);
            
            [path addClip];
            
            CGContextDrawImage(context, rect, image.CGImage);
            CGContextRestoreGState(context);
        }
        
        if (borderColor && borderWidth < minSize / 2 && borderWidth > 0) {
            
            CGFloat strokeInset = (floor(borderWidth * image.scale) + 0.5) / image.scale;
            
            CGRect strokeRect = CGRectInset(rect, strokeInset, strokeInset);
            
            CGFloat strokeRadius = radius > image.scale / 2 ? radius - image.scale / 2 : 0;
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
            [path closePath];
            
            path.lineWidth = borderWidth;
            path.lineJoinStyle = borderLineJoin;
            
            [borderColor setStroke];
            
            [path stroke];
        }
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(image);
            }
        });
    });
}

@end

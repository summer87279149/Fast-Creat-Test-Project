//
//  UIImage+Mo.m
//  foot
//
//  Created by Admin on 16/10/28.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "UIImage+Mo.h"

@implementation UIImage (Mo)

//name:图片名 borderWidth:圆环宽度 borderColor:圆环颜色
+(instancetype)cicleImageWithName:(NSString *)name borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 22 * borderWidth;
    CGFloat imageH = oldImage.size.height + 22 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
//无环裁剪    name:图片名
+(instancetype)cicleImageWithName:(NSString *)name{
    
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    // 5.按照当前的路径形状(圆形)裁剪, 超出这个形状以外的内容都不显示
    CGContextClip(ctx);
    // 6.画图
    [oldImage drawInRect:circleRect];
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束
    UIGraphicsEndImageContext();
    
    return newImage;
    
    
}
///**

// *从图片中按指定的位置大小截取图片的一部分
// * UIImage image 原始的图片
// * CGRect rect 要截取的区域
// */
//+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
//    
//    //将UIImage转换成CGImageRef
//    CGImageRef sourceImageRef = [image CGImage];
//    
//    //按照给定的矩形区域进行剪裁
//    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
//    
//    //将CGImageRef转换成UIImage
//    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
//    
//    //返回剪裁后的图片
//    return newImage;
//}

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [image CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    //返回剪裁后的图片
    return newImage;
}
@end

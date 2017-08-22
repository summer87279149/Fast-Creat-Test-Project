//
//  UIImage+Mo.h
//  foot
//
//  Created by Admin on 16/10/28.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mo)
//name:图片名 borderWidth:圆环宽度 borderColor:圆环颜色
+(instancetype)cicleImageWithName:(NSString *)name borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor;

//无环裁剪    name:图片名
+(instancetype)cicleImageWithName:(NSString *)Name ;

//+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

/**
 根据cgrect剪裁图像

 @param image 图像
 @param rect  图像需要变成的cgrect方框

 @return uiimage
 */
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;
@end

//
//  UIColor+extend.h
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIColor (extend)

// 将十六进制的颜色值转为objective-c的颜色
+ (id)getColor:(NSString *) hexColor;
@end

//
//  UIButton+XT_BtnCreate.h
//  YZGL
//
//  Created by Admin on 17/3/1.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XT_BtnCreate)
+(UIButton *)XT_createBtnWithTitle:(NSString*)title TitleColor:(UIColor*)titleColor TitleFont:(NSNumber*)size cornerRadio:(NSNumber *)radio BGColor:(UIColor*)BGColor Borderline:(NSNumber*)lineSize BorderColor:(UIColor *)BorderColor target:(id)tar Method:(SEL)selec ;

@end

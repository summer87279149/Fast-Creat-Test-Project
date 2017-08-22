//
//  UIButton+XT_BtnCreate.m
//  YZGL
//
//  Created by Admin on 17/3/1.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UIButton+XT_BtnCreate.h"

@implementation UIButton (XT_BtnCreate)
+(UIButton *)XT_createBtnWithTitle:(NSString*)title TitleColor:(UIColor*)titleColor TitleFont:(NSNumber*)size cornerRadio:(NSNumber *)radio BGColor:(UIColor*)BGColor Borderline:(NSNumber*)lineSize BorderColor:(UIColor *)BorderColor target:(id)tar Method:(SEL)selec {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (size) {
        btn.titleLabel.font = [UIFont systemFontOfSize:[size floatValue]];
    }
    
    if (BGColor) {
        btn.backgroundColor = BGColor;
    }
    
    if (BorderColor) {
        btn.layer.borderColor = BorderColor.CGColor;
    }
    
    if (lineSize) {
        btn.layer.borderWidth = [lineSize floatValue];
    }
    
    if (radio) {
        btn.layer.cornerRadius = [radio floatValue];
    }
    
    if (selec) {
        [btn addTarget:tar action:selec forControlEvents:UIControlEventTouchUpInside];
    }
    btn.showsTouchWhenHighlighted = YES;
    return btn;
}
+(UIButton *)XT_creteBtnWithTitle:(NSString *)title TitleColor:(UIColor*)titleColor cornerRadio:(NSNumber *)radio{
   return  [self XT_createBtnWithTitle:title TitleColor:titleColor TitleFont:nil cornerRadio:nil BGColor:nil Borderline:nil BorderColor:nil target:nil Method:nil];

}
@end

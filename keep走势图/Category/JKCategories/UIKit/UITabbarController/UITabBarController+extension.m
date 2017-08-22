//
//  UITabBarController+extension.m
//  YZGL
//
//  Created by Admin on 17/2/27.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UITabBarController+extension.h"
//#import "BaseNavViewController.h"
@implementation UITabBarController (extension)
- (void)addViewController :(UIViewController *)viewContro withImage:(NSString *)imageName WithSelectImage:(NSString *)selectImage WithTitle:(NSString *)title {
    viewContro.title = title;
    
    UIImage *TempImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.image = TempImage;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    
    [viewContro.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    
    dic2[NSForegroundColorAttributeName]=[UIColor redColor];
    
    [viewContro.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
    //     取消系统控制器的渲染效果
    UIImage *selectTempImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.selectedImage = selectTempImage;
    
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:viewContro];
    [self addChildViewController:nav];
    
    
}

@end

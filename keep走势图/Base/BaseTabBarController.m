//
//  BaseTabBarController.m
//  NewShenZhouShiFu
//
//  Created by Admin on 2017/6/12.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "BaseNavViewController.h"
#import "BaseTabBarController.h"

@interface BaseTabBarController ()<UITabBarDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    HomeViewController *vc = [HomeViewController new];
//    [self addViewController:vc withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"首页"];
//    
//    GoodShopViewController *vc2 = [GoodShopViewController new];
//    [self addViewController:vc2 withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"好店"];
//    
//    TecViewController *vc3 = [TecViewController new];
//    [self addViewController:vc3 withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"名师"];
//    
//    MallViewController *vc4 = [MallViewController new];
//    [self addViewController:vc4 withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"商场"];
//    
//    MineViewController *vc5 = [MineViewController new];
//    [self addViewController:vc5 withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"我的"];
    
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBarBackImage"];
//    self.tabBar.tintColor =COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViewController :(UIViewController *)viewContro withImage:(NSString *)imageName WithSelectImage:(NSString *)selectImage WithTitle:(NSString *)title {
    viewContro.title = title;
    
    UIImage *TempImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.image = TempImage;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
//    dic[NSForegroundColorAttributeName]=COLOR;
    
    [viewContro.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    
    dic2[NSForegroundColorAttributeName]=[UIColor whiteColor];
    
    [viewContro.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
    //     取消系统控制器的渲染效果
    UIImage *selectTempImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.selectedImage = selectTempImage;
    
    
    BaseNavViewController *nav=[[BaseNavViewController alloc]initWithRootViewController:viewContro];
    [self addChildViewController:nav];
    
    
}


@end

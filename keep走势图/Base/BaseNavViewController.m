//
//  BaseNavViewController.m
//  Driver
//
//  Created by Admin on 17/2/13.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
//    self.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 将控制器中的返回按钮进行统一设置
        //        viewController.navigationItem.leftBarButtonItem = [self addBarItemWithImage:@"backW" WithHighImage:@"backW" WithTagetAction:@selector(backClick) WithTarger:self];
        
        //        viewController.navigationItem.rightBarButtonItem = [self addBarItemWithImage:@"tabbar_home" WithHighImage:@"tabbar_home_selected" WithTagetAction:@selector(homeBtnClick) WithTarger:self];
    }
    [super pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

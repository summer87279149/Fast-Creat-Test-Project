//
//  UIView+Screenshot.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKScreenshot)
/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)jk_screenshot;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param maxWidth    一个view
 *
 *  @return 截图
 */
- (UIImage *)jk_screenshot:(CGFloat)maxWidth;
@end

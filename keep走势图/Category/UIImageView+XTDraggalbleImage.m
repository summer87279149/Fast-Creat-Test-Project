//
//  UIImageView+XTDraggalbleImage.m
//  YZGL
//
//  Created by Admin on 17/3/11.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UIImageView+XTDraggalbleImage.h"
#import <objc/runtime.h>
#define PADDING     5
static void *DragEnableKey = &DragEnableKey;
static void *AdsorbEnableKey = &AdsorbEnableKey;
@implementation UIImageView (XTDraggalbleImage)

-(void)setDragEnable:(BOOL)dragEnable
{
    objc_setAssociatedObject(self, DragEnableKey,@(dragEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isDragEnable
{
    return [objc_getAssociatedObject(self, DragEnableKey) boolValue];
}

-(void)setAdsorbEnable:(BOOL)adsorbEnable
{
    objc_setAssociatedObject(self, AdsorbEnableKey,@(adsorbEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isAdsorbEnable
{
    return [objc_getAssociatedObject(self, AdsorbEnableKey) boolValue];
}

CGPoint begincenter;
CGPoint beginPoint;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
        return;
    }
    begincenter=self.center;
    UITouch *touch = [touches anyObject];
    beginPoint = [touch locationInView:self.superview];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint nowPoint = [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];
    float offsetX = nowPoint.x - prePoint.x;
    float offsetY = nowPoint.y - prePoint.y;
    //    self.transform =  // 移动当前view
    //    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    
    //x轴左右极限坐标
    if (self.center.x > (self.superview.frame.size.width-self.frame.size.width/2))
    {
        CGFloat x = self.superview.frame.size.width-self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
        
    }
    else if (self.center.x < self.frame.size.width/2)
    {
        CGFloat x = self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
    }
    
    //y轴上下极限坐标
    if (self.center.y > (self.superview.frame.size.height-self.frame.size.height/2))
    {
        CGFloat x = self.center.x;
        CGFloat y = self.superview.frame.size.height-self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    }
    else if (self.center.y <= self.frame.size.height/2)
    {
        CGFloat x = self.center.x;
        CGFloat y = self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    NSLog(@"当前位置:%@",NSStringFromCGRect(self.frame));
    
}

@end

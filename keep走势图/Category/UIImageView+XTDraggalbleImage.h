//
//  UIImageView+XTDraggalbleImage.h
//  YZGL
//
//  Created by Admin on 17/3/11.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XTDraggalbleImage)
@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;
@end

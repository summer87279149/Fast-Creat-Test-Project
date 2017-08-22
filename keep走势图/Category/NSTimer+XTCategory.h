//
//  NSTimer+XTCategory.h
//  foot
//
//  Created by Admin on 16/8/12.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XTCategory)
+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)()) block repeats:(BOOL)repeat;

@end

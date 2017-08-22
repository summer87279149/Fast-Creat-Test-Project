//
//  NSTimer+XTCategory.m
//  foot
//
//  Created by Admin on 16/8/12.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "NSTimer+XTCategory.h"
/**
 *        NSTimer的分类创建完成后，创建定时的代码如下：一定要弱化self否则还是无法解决循环引用的问题。
 
            __weak typeof(self)weakSelf = self;
 
            self.timer = [NSTimer eocScheduledTimerWithTimeInterval:1.0 block:^{
 
            [weakSelf startTimer];
 
            } repeats:YES];
 */
@implementation NSTimer (XTCategory)
+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)()) block repeats:(BOOL)repeat{
    return  [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(startTimer:) userInfo:[block copy] repeats:repeat];
}
//定时器所执行的方法
+(void)startTimer:(NSTimer *)timer{
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
    
}

@end

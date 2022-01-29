//
//  NSTimer+Blocks.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer (Blocks)

+ (NSTimer *)zl_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(void))timerScheduleBlock repeats:(BOOL)yesOrNo{
    //Timer会对target强引用，但是此处target变成Timer类对象。因为类对象生命周期与应用程序一置的，不受引用计数限制，所以没关系。
    //class object 无需收回
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(ice_timerFiredFun:) userInfo:timerScheduleBlock repeats:yesOrNo];
}

+ (id)zl_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)(void) = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(ice_timerFiredFun:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (void)ice_timerFiredFun:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end

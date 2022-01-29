//
//  NSTimer+Blocks.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

// 定时器d 防止循环引

#import <Foundation/Foundation.h>

@interface NSTimer (Blocks)
+(id)zl_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))timerScheduleBlock repeats:(BOOL)inRepeats;
+(id)zl_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;
@end

/** 使用方式
 __weak typeof(self) weakSelf = self;
 mTimer = [NSTimer zl_scheduledTimerWithTimeInterval:1.0f block:^{
 //添加一次局部强引用，确保即使在block执行过程中外部的self被释放了也能顺利完成。局部变量strongSelf的生命周期只限于当前block，不会一直持有self，所以不影响外部self对象的引用计数平衡。
 //如果局部强引用，weakSelf可能会在block执行过程中因为外部self释放而被设置为nil。
 __strong typeof(weakSelf) strongSelf = weakSelf;
 [strongSelf timerFiredFun];
 } repeats:YES];
 
 */

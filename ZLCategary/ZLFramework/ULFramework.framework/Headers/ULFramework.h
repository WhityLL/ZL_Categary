//
//  ULFramework.h
//  ULFramework
//
//  Created by Liu Lei on 2021/3/28.
//

#import <Foundation/Foundation.h>

//! Project version number for ULFramework.
FOUNDATION_EXPORT double ULFrameworkVersionNumber;

//! Project version string for ULFramework.
FOUNDATION_EXPORT const unsigned char ULFrameworkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ULFramework/PublicHeader.h>

#import <ULFramework/ULClassA.h>


/**
 * 需要对外暴露的类
 * 1、在Build Phases -> Header -> Public 中引用【PS: 本文件也需要在里面引用】
 * 2、都要在这里声明
 *
 * 合并模拟器 真机器
 * lipo -create 真机下xxxx.framework地址 模拟器下xxxx.framework地址 -output 输出的路径
 *  注意：随后生成的可以看到是一个.lipo文件，这时候将这个文件去掉后缀， 改成合并前的文件名。然后把这个文件随便覆盖你的真机或者模拟机的之前我们合并时候的文件里面去， XXX.framework我们就合成并可以使用了， 支持真机和模拟器使用。
 将替换后的包copy到目标项目中。
 */

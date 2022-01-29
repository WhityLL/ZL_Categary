//
//  UIImage+Image.h
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithRenderingOriginalName:(NSString *)imageName;

/**
 加载图片

 @param name 图片名
 @return image
 */
+ (UIImage *)imageWithNamed:(NSString *)name;


/**
 * 返回一张自由拉伸的图片
 */
+ (UIImage *)resizeImageWithName:(NSString *)name;

/**
 image 渐变

 @param colors 颜色数组
 @param frame 尺寸
 @return image
 */
+ (UIImage*)getImageFromColors:(NSArray*)colors withFrame:(CGRect)frame;


/**
 *  图片压缩到指定大小
 *
 *  @param targetSize 母庙图片大小
 *
 *  @return image
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end

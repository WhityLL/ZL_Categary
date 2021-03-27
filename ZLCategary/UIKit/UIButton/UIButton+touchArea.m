//
//  UIButton+touchArea.m
//  LiShe
//
//  Created by lishe on 2018/6/28.
//  Copyright © 2018年 LiShe. All rights reserved.
//

#import "UIButton+touchArea.h"
#import <objc/runtime.h>

@implementation UIButton (touchArea)

- (void)setEnLargeTouchAreaEdge:(UIEdgeInsets)enLargeTouchAreaEdge{
    NSValue *value = [NSValue valueWithUIEdgeInsets:enLargeTouchAreaEdge];
    objc_setAssociatedObject(self, @selector(enLargeTouchAreaEdge), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)enLargeTouchAreaEdge{
    return [objc_getAssociatedObject(self, @selector(enLargeTouchAreaEdge)) UIEdgeInsetsValue];
}

//扩大关闭按钮的点击区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    UIEdgeInsets touchAreaInsets = self.enLargeTouchAreaEdge;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}


@end

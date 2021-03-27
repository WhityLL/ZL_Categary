//
//  UIView+badgeValue.m
//  BeautyPlus
//
//  Created by 陈威 on 15/11/3.
//  Copyright © 2015年 BeautyPlus. All rights reserved.
//

#import "UIView+BadgeValue.h"

@implementation UIView (BadgeValue)

- (void)showBadgeValue:(NSString *)strBadgeValue
{
    //为空或者为0的时候  不显示
    if (strBadgeValue.length == 0 || [strBadgeValue isEqualToString:@"0"]) {
        [self removeBadgeValue];
        strBadgeValue = nil;
    }
    //初始化
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:0];
    item.badgeValue = strBadgeValue;
    tabBar.items = @[item];
    //寻找系统view
    for (UIView *viewTab in tabBar.subviews)
    {
        for (UIView *subview in viewTab.subviews)
        {
            NSString *strClassName = [NSString stringWithUTF8String:object_getClassName(subview)];
            if ([strClassName isEqualToString:@"_UIBadgeView"])
            {
                //从原视图上移除
                [self removeBadgeValue];
                //
                subview.frame = CGRectMake(self.frame.size.width - subview.frame.size.width / 2, - subview.frame.size.height / 2,
                                           subview.frame.size.width, subview.frame.size.height);
                subview.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
                [self addSubview:subview];
                return;
            }
        }
    }
}

- (void)removeBadgeValue
{
    for (UIView *subview in self.subviews)
    {
        NSString *strClassName = [NSString stringWithUTF8String:object_getClassName(subview)];
        if ([strClassName isEqualToString:@"_UIBadgeView"])
        {
            [subview removeFromSuperview];
            break;
        }
    }
}

@end


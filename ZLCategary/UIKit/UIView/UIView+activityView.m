//
//  UIView+activityView.m
//  Paihuo
//
//  Created by m2ciMAC-2 on 2017/8/10.
//  Copyright © 2017年 Steve Wind. All rights reserved.
//

#import "UIView+activityView.h"
#import <objc/runtime.h>

@implementation UIView (activityView)
- (void)appendActivityView:(UIColor *)color{
    //1.添加菊花
    if (!self.appendActivity) {
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicator.frame = self.bounds;
        activityIndicator.color = color;
        [activityIndicator startAnimating];
        [activityIndicator setHidesWhenStopped:YES];
        self.appendActivity = activityIndicator;
        
        //隐藏其它子视图
        for (UIView *view in self.subviews) {
            view.hidden = YES;
        }
        [self addSubview:activityIndicator];
    }
    
    [self bringSubviewToFront:self.appendActivity];
    
    //2.如果是scrollView，则在显示菊花时禁止滑动
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        scrollView.scrollEnabled = NO;
    }
}

- (void)removeActivityView{
    //1.恢复滑动
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        scrollView.scrollEnabled = YES;
    }
    
    for (UIView *view in self.subviews) {
        view.hidden = NO;
    }
    
    //2.去掉菊花
    if (self.appendActivity) {
        self.appendActivity.hidden = YES;
        [self.appendActivity stopAnimating]; // 结束旋转
        [self.appendActivity removeFromSuperview];
    }
}


#pragma mark - 运行时添加属性
- (UIActivityIndicatorView *)appendActivity{
    return objc_getAssociatedObject(self, @selector(setAppendActivity:));
}

- (void)setAppendActivity:(UIActivityIndicatorView *)appendActivity{
    objc_setAssociatedObject(self, @selector(setAppendActivity:), appendActivity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


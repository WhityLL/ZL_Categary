//
//  UIView+activityView.h
//  Paihuo
//
//  Created by m2ciMAC-2 on 2017/8/10.
//  Copyright © 2017年 Steve Wind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (activityView)

- (void)appendActivityView:(UIColor *)color;

- (void)removeActivityView;

@property (nonatomic,strong) UIActivityIndicatorView *appendActivity;/**< 附加菊花图 */

@end

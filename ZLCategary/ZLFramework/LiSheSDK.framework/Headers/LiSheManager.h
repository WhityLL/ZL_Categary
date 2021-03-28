//
//  LiSheManager.h
//  LiSheSDK
//
//  Created by lishe on 2019/6/3.
//  Copyright © 2019 lishe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LiSheManager : NSObject

- (void)ls_showMainVCInParentVC:(UIViewController *)vc;

- (void)openLog:(BOOL)isOpen;

@end

NS_ASSUME_NONNULL_END

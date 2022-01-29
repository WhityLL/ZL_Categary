//
//  NSBundle+ZLCategary.h
//  DemoA
//
//  Created by Liu Lei on 2022/1/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (ZLCategary)

+ (NSBundle *)zlCategory_Bundle;

+ (NSString *)zlCategory_localizedStringForKey:(NSString *)key;

+ (NSString *)zlCategory_localizedStringForKey:(NSString *)key value:(nullable NSString *)value;

@end

NS_ASSUME_NONNULL_END

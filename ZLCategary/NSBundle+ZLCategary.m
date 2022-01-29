//
//  NSBundle+ZLCategary.m
//  DemoA
//
//  Created by Liu Lei on 2022/1/29.
//

#import "NSBundle+ZLCategary.h"
#import "Foo.h"

@implementation NSBundle (ZLCategary)
+ (NSBundle *)zlCategory_Bundle {
    NSString *bundlePath = [[NSBundle bundleForClass:[Foo class]] pathForResource:@"ZLCategory" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return bundle;
}

+ (NSString *)zlCategory_localizedStringForKey:(NSString *)key {
    return [self zlCategory_localizedStringForKey:key value:nil];
}

+ (NSString *)zlCategory_localizedStringForKey:(NSString *)key value:(NSString *)value {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        NSString *language = @"";
        // 如果配置中没有配置语言
        if (!language) {
            // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
            language = [NSLocale preferredLanguages].firstObject;
        }

        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans"; // 简体中文
            } else { // zh-Hant\zh-HK\zh-TW
                language = @"zh-Hant"; // 繁體中文
            }
        } else if ([language hasPrefix:@"ko"]) {
            language = @"ko";
        } else if ([language hasPrefix:@"ru"]) {
            language = @"ru";
        } else if ([language hasPrefix:@"uk"]) {
            language = @"uk";
        } else if ([language hasPrefix:@"ja"]) {
            language = @"ja";
        } else {
            language = @"en";
        }

        NSBundle *b = [NSBundle zlCategory_Bundle];

        // 从zlRefresh.bundle中查找资源
        bundle = [NSBundle bundleWithPath:[[NSBundle zlCategory_Bundle] pathForResource:language ofType:@"lproj"]];
    }
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}
@end

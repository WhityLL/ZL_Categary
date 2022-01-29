//
//  Foo.m
//  DemoA
//
//  Created by Liu Lei on 2022/1/29.
//

#import "Foo.h"
#import "NSBundle+ZLCategary.h"

@implementation Foo

- (void)sayHello {
    NSString *str = [NSBundle zlCategory_localizedStringForKey:@"ULCommonStringfufei"];
    NSLog(@"ZLCategary Bundle 国际化 = %@", str);
}

@end

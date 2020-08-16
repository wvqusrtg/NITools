//
//  NSBundle+NILibrary.m
//  Pods
//
//  Created by ai-nixs on 2020/8/16.
//

#import "NSBundle+NILibrary.h"

@implementation NSBundle (NILibrary)
+ (NSBundle *)NILibraryBundleWithClassName:(NSString*)aClassName{
    return [self bundleWithURL:[self NILibraryBundleURLWithClassName:aClassName]];
}
+ (NSURL *)NILibraryBundleURLWithClassName:(NSString*)aClassName{
    //NSBundle *bundle = [NSBundle bundleForClass:[MYSomeClass class]];
    //NSString * _Nonnull aClassName
    //[NSBundle bundleForClass:(nonnull Class)];
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(aClassName)];
    return [bundle URLForResource:@"NITools" withExtension:@"bundle"];
}
@end

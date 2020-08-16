//
//  UIImage+NILibrary.m
//  Pods
//
//  Created by ai-nixs on 2020/8/16.
//

#import "UIImage+NILibrary.h"
#import "NSBundle+NILibrary.h"

@implementation UIImage (NILibrary)
+ (UIImage *)NIBundleImageNamed:(NSString *)name withClassName:(NSString*)aClassName{
    return [self my_imageNamed:name inBundle:[NSBundle NILibraryBundleWithClassName:aClassName]];
}
+ (UIImage *)my_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([self respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}
@end

//
//  NSBundle+NILibrary.h
//  Pods
//
//  Created by ai-nixs on 2020/8/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 借鉴：http://blog.xianqu.org/2015/08/pod-resources/
/// by:nixs 2020年08月16日17:09:41
@interface NSBundle (NILibrary)
+ (NSBundle *)NILibraryBundleWithClassName:(NSString*)aClassName;
+ (NSURL *)NILibraryBundleURLWithClassName:(NSString*)aClassName;

@end

NS_ASSUME_NONNULL_END

//
//  UIImage+NILibrary.h
//  Pods
//
//  Created by ai-nixs on 2020/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 借鉴：http://blog.xianqu.org/2015/08/pod-resources/
/// by:nixs 2020年08月16日17:09:41
@interface UIImage (NILibrary)

/// 传入图片名称-在bundle里找到图片-by:nixs 2020年08月16日17:25:31
/// @param name 图片名称
/// @param aClassName 调用方类名称字符串
+ (UIImage *)NIBundleImageNamed:(NSString *)name withClassName:(NSString*)aClassName;

@end

NS_ASSUME_NONNULL_END

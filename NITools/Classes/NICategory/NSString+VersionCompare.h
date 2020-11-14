//
//  NSString+VersionCompare.h
//  NITools
//
//  Created by nixs on 2020/8/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (VersionCompare)
/**
 比较两个版本号的大小（2.0）
    
 @param v1 第一个版本号
 @param v2 第二个版本号
 @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
 */

/// 比较两个版本号的大小（2.0）
/// @param v1 v1 第一个版本号
/// @param v2 v2 第二个版本号
/// @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
+ (NSInteger)NICompareVersion:(NSString *)v1 to:(NSString *)v2;


/// 获取当前app版本
+ (NSString*)NIgetCurrentVersion;
@end

NS_ASSUME_NONNULL_END

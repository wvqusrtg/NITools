//
//  NSObject+ReadJsonFile.h
//  NITools
//
//  Created by ai-nixs on 2021/5/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ReadJsonFile)
#pragma mark - 读取本地json文件,返回可能为NSArray/NSDictionary
+ (id)readLocalFileWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

//
//  NSObject+ReadJsonFile.m
//  NITools
//
//  Created by ai-nixs on 2021/5/11.
//

#import "NSObject+ReadJsonFile.h"

@implementation NSObject (ReadJsonFile)
// 读取本地JSON文件
+ (id)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


@end

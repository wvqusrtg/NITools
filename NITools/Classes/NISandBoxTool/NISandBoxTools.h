//
//  NISandBoxTools.h
//  NITools
//
//  Created by nixs on 2020/11/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 获取沙盒主目录路径
#define homeDir NSHomeDirectory();
// 获取Documents目录路径
#define docDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
// 获取Library的目录路径
#define libDir [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
// 获取Caches目录路径
#define cachesDir [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
// 获取tmp目录路径
#define tmpDir NSTemporaryDirectory();

/// NSLog(@"%@",[[NSBundle mainBundle] bundlePath]);
/// NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"apple" ofType:@"png"];
/// UIImage *appleImage = [[UIImage alloc] initWithContentsOfFile:imagePath];

/// 参考：https://blog.csdn.net/wvqusrtg/article/details/109593864
@interface NISandBoxTools : NSObject

/// 获取沙盒主目录路径
+(NSString*)getHomeDir;

/// 获取Documents目录路径
+(NSString*)getDocmentDir;

/// 获取Library的目录路径
+(NSString*)getLibraryDir;

/// 获取Caches目录路径
+(NSString*)getCachesDir;

/// 获取tmp目录路径
+(NSString*)getTmpDir;



/// 创建文件夹
/// @param path 目标路径
+(BOOL)creatDir:(NSString *)path;

/// 创建文件
/// @param filePath 目标路径
+(BOOL)creatFile:(NSString*)filePath;

/// 写数据
/// @param filePath 目标路径
/// @param data 待写数据
+(BOOL)writeToFile:(NSString*)filePath contents:(NSData *)data;

/// 追加写数据
/// @param data 待追加数据
/// @param filePath 目标路径
+(BOOL)appendData:(NSData*)data withPath:(NSString *)filePath;

/// 读文件
/// @param path 目标路径
+(NSData*)readFileData:(NSString *)path;

/// 获取文件夹下所有的文件列表
/// @param path 目标路径
+(NSArray*)getFileList:(NSString*)path;

/// 获取文件夹下所有文件(深度遍历)
/// @param path 目标路径
+(NSArray*)getAllFileList:(NSString*)path;

/// 移动文件
/// @param fromPath fromPath description
/// @param toPath toPath description
/// @param dir dir description
+(BOOL)moveFile:(NSString *)fromPath toPath:(NSString *)toPath toPathIsDir:(BOOL)dir;

/// 删除文件
/// @param filePath 目标文件路径
+(BOOL)removeFile:(NSString*)filePath;

/// 删除文件夹
/// @param path 目标路径
+(BOOL)removeDir:(NSString*)path;

/// 删除某些后缀的文件
/// @param suffixList suffixList description
/// @param path path description
/// @param deep deep description
+(void)removeFileSuffixList:(NSArray<NSString*>*)suffixList filePath:(NSString*)path deep:(BOOL)deep;

/// 获取文件大小
/// @param path 目标文件路径
+(long long)getFileSize:(NSString*)path;

/// 获取文件的信息(包含了上面文件大小)
/// @param path 目标文件路径
+(NSDictionary*)getFileInfo:(NSString*)path;

@end

NS_ASSUME_NONNULL_END

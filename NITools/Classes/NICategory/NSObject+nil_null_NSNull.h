//
//  NSObject+nil_null_NSNull.h
//  NITools
//
//  Created by nixs on 2021/1/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (nil_null_NSNull)
#pragma mark - 1.判断方法
-(BOOL)isNull:(id)object;

#pragma mark - 2.对空处理
-(NSString*)convertNull:(id)object;

#pragma mark - 3.json 返回NSNull处理
//-(id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property;

@end

NS_ASSUME_NONNULL_END

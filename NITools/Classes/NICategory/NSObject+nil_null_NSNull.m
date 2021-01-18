
//
//  NSObject+nil_null_NSNull.m
//  NITools
//
//  Created by nixs on 2021/1/6.
//

#import "NSObject+nil_null_NSNull.h"

@implementation NSObject (nil_null_NSNull)
-(BOOL)isNull:(id)object{
    // 判断是否为空
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }else if ([object isKindOfClass:[NSNull class]]){
        return NO;
    }else if (object==nil){
        return NO;
    }
    return YES;
}

-(NSString*)convertNull:(id)object{
    // 转换空串
    if ([object isEqual:[NSNull null]]) {
        return @" ";
    }else if ([object isKindOfClass:[NSNull class]]){
        return @" ";
    }else if (object==nil){
        return @"无";
    }
    return object;
}

//- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
//    if (oldValue == [NSNull null]) {
//        if ([oldValue isKindOfClass:[NSArray class]]) {
//            return  @[];
//        }else if([oldValue isKindOfClass:[NSDictionary class]]){
//            return @{};
//        }else{
//            return @"";
//        }
//    }
//    return oldValue;
//}
@end

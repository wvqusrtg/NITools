//
//  UITextField+Check.m
//  AFNetworking
//
//  Created by nixs on 2020/12/14.
//

#import "UITextField+Check.h"

@implementation UITextField (Check)
- (BOOL)isEmptyText
{
    return self.text.length == 0;
}

/*
 中国移动:
 135、136、137、138、139、147（数据卡）、148、150、151、152、157、158、159、178、182、183、184、187、188、198、
 134（0-8）、1440、1703、1705、1706
 
 中国联通:
 130、131、132、145（数据卡）、146、155、156、166、175、176、185、186、
 1707、1708、1709 、
 
 中国电信:
 133、149、153、173、177、180、181、189、199、
 1349、1410、1700、1701、1702、
 
 虛拟运营商: 1700、1705、1707、1708、1709......代理联通移动电信业务
 
 */
// 判断手机号码格式是否正确
- (BOOL)isValidPhoneNumber
{
    //    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (self.text.length != 11)
    {
        return NO;
    }
    else
    {
        /**
         * 移动号段正则表达式
         * CM China Mobile
         */
        NSString *CMPhoneSegmentRegExp = @"^1((3[5-9])|(4[7-8])|(5[0-2,7-9])|(78)|(8[2-4,7-8])|(98))\\d{8}|((34[0-8])|(440)|(70[3,5-6]))\\d{7}$";
        /**
         * 联通号段正则表达式
         * CU China Unicom
         */
        NSString *CUPhoneSegmentRegExp = @"^1((13[0-2])|(4[5-6])|(5[5-6])|(66])|(7[5-6])|(8[5,6]))\\d{8}|(70[7-9])\\d{7}$";
        /**
         * 电信号段正则表达式
         * CT China Telecom
         */
        NSString *CTPhoneSegmentRegExp = @"^1((33)|(49)|(53)|(17[3-7])|(18[0,1,9])|(99))\\d{8}((349)|(410)|(70[0-2]))\\d{7}$";
        
        NSPredicate *predicateCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CMPhoneSegmentRegExp];
        BOOL isMatchCM = [predicateCM evaluateWithObject:self.text];
        NSPredicate *predicateCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CUPhoneSegmentRegExp];
        BOOL isMatchCU = [predicateCU evaluateWithObject:self.text];
        NSPredicate *predicateCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CTPhoneSegmentRegExp];
        BOOL isMatchCT = [predicateCT evaluateWithObject:self.text];
        
        if (isMatchCM || isMatchCU || isMatchCT)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
}

// 判断秘密格式为 6 - 18 位数字和字母组成
- (BOOL)isValidPassword
{
    NSString *regExp = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExp];
    if ([predicate evaluateWithObject:self.text])
    {
        return YES ;
    }
    else
    {
        return NO;
    }
}

// 长度是否超过6位数并小于18位数
- (BOOL)isMoreThanSixLength
{
    return (self.text.length >= 6 && self.text.length <= 18);
}
@end

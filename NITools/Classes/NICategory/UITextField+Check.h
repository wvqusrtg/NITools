//
//  UITextField+Check.h
//  AFNetworking
//
//  Created by nixs on 2020/12/14.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Check)
// 判断输入框内容是否为空
- (BOOL)isEmptyText;
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
- (BOOL)isValidPhoneNumber;

// 判断秘密格式为 6 - 18 位数字和字母组成
- (BOOL)isValidPassword;

// 长度是否超过6位数并小于18位数
- (BOOL)isMoreThanSixLength;

@end

NS_ASSUME_NONNULL_END

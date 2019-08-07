//
//  NSString+lqcRegular.m
//  MicaLife
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019 HaierMoney. All rights reserved.
//

#import "NSString+LQCRegular.h"

@implementation NSString (LQCRegular)

//正整数  (如果是输入中的，@"" 认为是可以)
+ (NSString *)lqc_inputtingPositiveIntegerRegular
{
    return @"^([1-9][0-9]*){0,1}$";
}


+ (NSString *)lqc_positiveIntegerRegular
{
    return @"^[1-9][0-9]*$";
}

+ (NSString *)lqc_decimal_2{
    return @"^(([1-9]{1}[0-9]*)|[0]{1})([.][0-9]{0,2}){0,1}$";
}

//手机号码 phone  (如果是输入中的，@"" 认为是可以)
+ (NSString *)lqc_inputtingPhoneNumberRegular
{
    return @"^([1][0-9]{0,10}){0,1}$";
}


+ (NSString *)lqc_phoneNumberRegular
{
    return @"^[1][0-9]{10}$";
}



+ (NSString *)lqc_emailRegular{
    return @"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
}

+ (NSString *)lqc_idCardNumberRegular{
    return @"\\d{17}(\\d|X|x)";
}

+ (NSString *)lqc_allChineseRegular{
    return @"(^[\u4e00-\u9fa5]+$)";
}

@end

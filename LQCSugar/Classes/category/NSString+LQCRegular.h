//
//  NSString+lqcRegular.h
//  MicaLife
//
//  Created by mac on 2019/2/27.
//  Copyright © 2019 HaierMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LQCRegular)

//正整数  (如果是输入中的，@"" 认为是可以)
+ (NSString *)lqc_inputtingPositiveIntegerRegular;
+ (NSString *)lqc_positiveIntegerRegular;

//小数点后两位  0、 0.、0.0、 0.00 都是可以的
+ (NSString *)lqc_decimal_2;

//手机号码 phone  (如果是输入中的，@"" 认为是可以)
+ (NSString *)lqc_inputtingPhoneNumberRegular;
+ (NSString *)lqc_phoneNumberRegular;

//电子邮箱的
+ (NSString *)lqc_emailRegular;

//身份证
+ (NSString *)lqc_idCardNumberRegular;

//全中文
+ (NSString *)lqc_allChineseRegular;


@end

NS_ASSUME_NONNULL_END

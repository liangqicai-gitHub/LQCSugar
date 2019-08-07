//
//  NSString+Usual.h
//  sdfd
//
//  Created by 梁齐才 on 16/5/26.
//  Copyright © 2016年 梁齐才. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LQC_S_F(...) [NSString stringWithFormat:__VA_ARGS__]
#define LQC_S_New(a) [NSString lqc_newString:a]
#define LQC_S_DocumetsPath [NSString lqc_documentsDirectory]

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LQCUsual)

// (去掉两头的空串) 判断是不是空串
+ (BOOL)lqc_isEmptyString:(nullable NSString *)string;

+ (BOOL)lqc_isNoLengthString:(nullable NSString *)string;

+ (NSString *)lqc_newString:(nullable NSString *)string;

//document目录
+ (NSString *)lqc_documentsDirectory;

// 参数 = sss.txt
+ (nullable NSString *)lqc_mainBundelResourcePath:(nullable NSString *)resourceName;

//去掉空格
- (NSString *)lqc_trimString;

//子串出现的所有range 从左到右排列
- (nullable NSArray<NSValue *> *)lqc_rangesOfString:(NSString *)searchString;

// 1是星期天 （日）   7是星期6（六）
+ (NSString *)lqc_weekDayWithIndex:(NSInteger)index;


+ (NSString *)lqc_numeralsInTheCapitalForm:(NSInteger)index;

//不是则返回0
+ (NSInteger)lqc_numberOfObject:(id)obj;

@end

NS_ASSUME_NONNULL_END

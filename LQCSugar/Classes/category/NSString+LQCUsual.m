//
//  NSString+Usual.m
//  sdfd
//
//  Created by 梁齐才 on 16/5/26.
//  Copyright © 2016年 梁齐才. All rights reserved.
//

#import "NSString+LQCUsual.h"


@implementation NSString (LQCUsual)

+ (BOOL)lqc_isEmptyString:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]){
        return YES;
    };
    
    return [string lqc_trimString].length == 0;
}

+ (BOOL)lqc_isNoLengthString:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]){
        return YES;
    };
    
    return string.length == 0;
}

+ (NSString *)lqc_newString:(NSString *)string
{
    if ([string isKindOfClass:[NSNumber class]]){
        return LQC_S_F(@"%@",string);
    }
    
    if ([NSString lqc_isEmptyString:string]){
        return @"";
    }
    return [string lqc_trimString];
}


+ (NSString *)lqc_documentsDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                               NSUserDomainMask,
                                               YES)[0];
}

+ (NSString *)lqc_mainBundelResourcePath:(NSString *)resourceName
{
    return [[NSBundle mainBundle] pathForResource:LQC_S_New(resourceName) ofType:nil];
}

- (NSString *)lqc_trimString
{
    NSCharacterSet *spaceSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:spaceSet];
}


- (NSArray *)lqc_rangesOfString:(NSString *)searchString
{
    NSMutableArray *results = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, [self length]);
    NSRange range;
    
    while ((range = [self
                     rangeOfString:searchString
                     options:0
                     range:searchRange]).location != NSNotFound)
    {
        [results addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range),
                                  [self length] - NSMaxRange(range));
    }
    return results;
}


+ (NSString *)lqc_weekDayWithIndex:(NSInteger)index
{
    switch (index) {
        case 1:
            return @"日";
            break;
        case 2:
            return @"一";
            break;
        case 3:
            return @"二";
            break;
        case 4:
            return @"三";
            break;
        case 5:
            return @"四";
            break;
        case 6:
            return @"五";
            break;
        case 7:
            return @"六";
            break;
        
        default:
            return @"";
            break;
    }
}


+ (NSString *)lqc_numeralsInTheCapitalForm:(NSInteger)index
{
    switch (index) {
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"七";
            break;
        case 8:
            return @"八";
            break;
        case 9:
            return @"九";
            break;
        case 10:
            return @"十";
            break;
        case 11:
            return @"十一";
            break;
        case 12:
            return @"十二";
            break;
            
        default:
            return @"";
            break;
    }
}


+ (NSInteger)lqc_numberOfObject:(id)obj
{
    if ([obj respondsToSelector:@selector(integerValue)]){
        return [obj integerValue];
    }
    return 0;
}


@end



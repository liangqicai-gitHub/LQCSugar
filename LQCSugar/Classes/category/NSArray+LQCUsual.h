//
//  NSArray+Usual.h
//  sdfd
//
//  Created by 梁齐才 on 16/5/26.
//  Copyright © 2016年 梁齐才. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

#define LQC_Arr_New(a) [NSArray lqc_newArrFromObj:a]
#define LQC_Arr_Safe(a,b) [NSArray lqc_safeObjAtInde:b inArr:a]

@interface NSArray (LQCUsual)

+ (BOOL)lqc_isEmpty:(nullable id)sender;

+ (BOOL)lqc_isArray:(nullable id)sender equalOrLongerThan:(NSInteger)count;

- (nullable id)lqc_safeObjAtIndex:(NSInteger)index;

+ (nullable id)lqc_safeObjAtInde:(NSInteger)index inArr:(nullable NSArray *)arr;

+ (NSArray *)lqc_newArrFromObj:(NSObject *)obj;

@end

NS_ASSUME_NONNULL_END


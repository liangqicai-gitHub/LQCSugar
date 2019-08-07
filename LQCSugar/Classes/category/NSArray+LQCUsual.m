//
//  NSArray+Usual.m
//  sdfd
//
//  Created by 梁齐才 on 16/5/26.
//  Copyright © 2016年 梁齐才. All rights reserved.
//

#import "NSArray+LQCUsual.h"

@implementation NSArray (LQCUsual)

+ (BOOL)lqc_isEmpty:(id)sender
{
    if ([sender isKindOfClass:[NSArray class]]){
        return [(NSArray *)sender count] == 0;
    }
    return YES;
}


+ (BOOL)lqc_isArray:(id)sender equalOrLongerThan:(NSInteger)count
{
    if (![sender isKindOfClass:[NSArray class]]){
        return NO;
    }
    
    return [(NSArray *)sender count] >= count;
}


- (id)lqc_safeObjAtIndex:(NSInteger)index
{
    if (index < 0) return nil;
    
    if (self.count > index){
        return [self objectAtIndex:index];
    }
    return nil;
}

+ (id)lqc_safeObjAtInde:(NSInteger)index inArr:(NSArray *)arr
{
    if ([arr isKindOfClass:[NSArray class]]){
        return [arr lqc_safeObjAtIndex:index];
    }
    return nil;
}

+ (NSArray *)lqc_newArrFromObj:(NSObject *)obj{
    if ([self lqc_isEmpty:obj]){
        return @[];
    }else{
        return (NSArray *)obj;
    }
}

@end

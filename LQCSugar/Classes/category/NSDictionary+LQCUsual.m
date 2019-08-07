//
//  NSDictionary+LQCUsual.m
//  AFNetworking
//
//  Created by mac on 2019/8/7.
//

#import "NSDictionary+LQCUsual.h"

@implementation NSDictionary (LQCUsual)

+ (BOOL)lqc_isEmpty:(nullable id)sender{
    if ([sender isKindOfClass:[NSDictionary class]]){
        return [(NSDictionary *)sender allKeys].count == 0;
    }else{
        return YES;
    }
}

+ (NSDictionary *)lqc_DicArrFromObj:(NSObject *)obj{
    if ([self lqc_isEmpty:obj]){
        return @{};
    }else{
        return (NSDictionary *)obj;
    }
}


@end

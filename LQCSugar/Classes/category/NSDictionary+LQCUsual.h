//
//  NSDictionary+LQCUsual.h
//  AFNetworking
//
//  Created by mac on 2019/8/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define LQC_Dic_New(a) [NSArray lqc_DicArrFromObj:a]

@interface NSDictionary (LQCUsual)

+ (BOOL)lqc_isEmpty:(nullable id)sender;

+ (NSDictionary *)lqc_DicArrFromObj:(NSObject *)obj;

@end

NS_ASSUME_NONNULL_END

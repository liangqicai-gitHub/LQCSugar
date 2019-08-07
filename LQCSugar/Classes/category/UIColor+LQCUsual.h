//
//  UIColor+Usual.h
//  sdfd
//
//  Created by 梁齐才 on 16/5/26.
//  Copyright © 2016年 梁齐才. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LQC_C_RGB(r,g,b)     [UIColor lqc_r_int:r g_int:g b_int:b a_f:1.0f]
#define LQC_C_RGBA(r,g,b,a)  [UIColor lqc_r_int:r g_int:g b_int:b a_f:a]
#define LQC_C_HexRGB(RGB)    [UIColor lqc_colorWithHexRGB:RGB]
#define LQC_C_HexRGBA(RGBA)  [UIColor lqc_colorWithHexRGBA:RGBA]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LQCUsual)

+ (UIColor *)lqc_colorWithHexRGB:(NSInteger)RGB;

+ (UIColor *)lqc_colorWithHexRGBA:(NSInteger)RGBA;

+ (UIColor *)lqc_r_int:(NSInteger )r g_int:(NSInteger )g b_int:(NSInteger )b a_f:(CGFloat)a;

- (UIImage *)lqc_pureColorImage;

NS_ASSUME_NONNULL_END

@end

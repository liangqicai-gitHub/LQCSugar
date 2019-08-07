//
//  UIImage+Gradient.h
//  btn
//
//  Created by 梁齐才 on 17/4/11.
//  Copyright © 2017年 LYZ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,LQCGradientdirection)  {
    LQCGradientdirection_topToBottom = 0,//从上到下
    LQCGradientdirection_leftToRight = 1,//从左到右
    LQCGradientdirection_upleftTolowRight = 2,//左上到右下
    LQCGradientdirection_uprightTolowLeft = 3,//右上到左下
};

@interface UIImage (LQCGradient)


+ (UIImage *)lqc_imageWithColors:(NSArray <UIColor *>*)colors
                            size:(CGSize)size
                       direction:(LQCGradientdirection)type;


@end

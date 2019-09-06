//
//  CenterAlterView.h
//  malashidai
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 haikatech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CenterAlterView : UIView

// 311pt  186  white cornerRadius 8  default
@property (nonatomic,strong) UIView *centerContentView;

- (void)showOnSuper:(UIView *)superView animation:(BOOL)animation;
- (void)dismissAnimation:(BOOL)animation block:(void (^ _Nullable )(void))block;

@end

NS_ASSUME_NONNULL_END

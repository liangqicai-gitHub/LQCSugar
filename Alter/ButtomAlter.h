//
//  ButtomAlter.h
//  malashidai
//
//  Created by mac on 2019/7/19.
//  Copyright © 2019 haikatech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtomAlter : UIView

@property (nonatomic,strong) UIView *contentView;

@property (assign) CGFloat expectedContentHeight;

- (void)showOnSuper:(UIView *)superView animation:(BOOL)animation;
- (void)dismissAnimation:(BOOL)animation block:(void (^ _Nullable )(void))block;

@end

NS_ASSUME_NONNULL_END

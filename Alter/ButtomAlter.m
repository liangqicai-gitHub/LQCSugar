//
//  ButtomAlter.m
//  malashidai
//
//  Created by mac on 2019/7/19.
//  Copyright © 2019 haikatech. All rights reserved.
//

#import "ButtomAlter.h"
#import <Masonry/Masonry.h>

#ifndef dispatch_queue_async_safe
#define dispatch_queue_async_safe(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}
#endif

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block) dispatch_queue_async_safe(dispatch_get_main_queue(), block)
#endif

@implementation ButtomAlter

- (instancetype)init{
    self = [super init];
    if (self){
        [self buttomAlter_initVarsAndViews];
    }
    return self;
}

- (void)buttomAlter_initVarsAndViews{
    self.contentView = [[UIView alloc] init];
    self.contentView.layer.cornerRadius = 16;
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
}

- (void)showOnSuper:(UIView *)superView animation:(BOOL)animation{
    [self dismissAnimation:NO block:nil];
    
    [superView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    CGFloat h = 0;
    if (@available(iOS 11.0, *)){
        h = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(16);
        make.height.mas_equalTo(16 + h + self.expectedContentHeight);
    }];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    if (animation){
        self.backgroundColor = [UIColor clearColor];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, 16 + h + self.expectedContentHeight);
        [UIView animateWithDuration:0.25 animations:^{
            self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
            self.contentView.transform = CGAffineTransformIdentity;
        }];
    }else{
        self.backgroundColor = [UIColor blackColor];
        self.contentView.transform = CGAffineTransformIdentity;
    }
}


- (void)dismissAnimation:(BOOL)animation block:(void (^)(void))block{
    if (animation){
        [UIView animateWithDuration:0.25 animations:^{
            self.contentView.transform = CGAffineTransformMakeTranslation(0, self.contentView.frame.size.height - 16);
            self.backgroundColor = [UIColor clearColor];
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
            dispatch_main_async_safe(^{
                if (block) block();
            })
        }];
    }else{
        [self removeFromSuperview];
        if (block) block();
    }
}

@end

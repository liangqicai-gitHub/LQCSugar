//
//  CenterAlterView.m
//  malashidai
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 haikatech. All rights reserved.
//

#import "CenterAlterView.h"
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


@implementation CenterAlterView


- (instancetype)init{
    self = [super init];
    if (self){
        [self centerAlterView_initVarsAndViews];
    }
    return self;
}


- (void)centerAlterView_initVarsAndViews{
    UIView *view = [[UIView alloc] init];
    view.layer.backgroundColor = [UIColor whiteColor].CGColor;
    view.layer.cornerRadius = 8;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
        make.size.mas_equalTo(CGSizeMake(311, 186));
    }];
    self.centerContentView = view;
}


- (void)showOnSuper:(UIView *)superView animation:(BOOL)animation{
    [self dismissAnimation:NO block:nil];
    
    [superView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    if (animation){
        self.centerContentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:0.25 animations:^{
            self.centerContentView.transform = CGAffineTransformIdentity;
            self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        }];
    }else{
        self.centerContentView.transform = CGAffineTransformIdentity;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
}


- (void)dismissAnimation:(BOOL)animation block:(void (^)(void))block{
    
    if (animation){
        [UIView animateWithDuration:0.25 animations:^{
            self.centerContentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
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

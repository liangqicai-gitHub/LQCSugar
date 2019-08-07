//
//  UIView+SeparateLine.m
//  kartor3
//
//  Created by 梁齐才 on 16/8/9.
//  Copyright © 2016年 CST. All rights reserved.
//

#import "UIView+LQCSeparateLine.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>


@implementation UIView (LQCSeparateLine)

#pragma mark - public

- (void)lqc_drawTopLine:(CGFloat)left right:(CGFloat)right{
    [self lqc_buildTopLine];
    UIView *topLine = [self lqc_sc_TopLine];
    [topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.right.mas_equalTo(right * -1);
        make.height.mas_equalTo(1.0 / [UIScreen mainScreen].scale);
        make.top.mas_equalTo(0);
    }];
}

- (void)lqc_drawBottomLine:(CGFloat)left right:(CGFloat)right
{
    [self lqc_buildBottomLine];
    
    UIView *bottomLine = [self lqc_sc_bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.right.mas_equalTo(right * -1);
        make.height.mas_equalTo(1.0 / [UIScreen mainScreen].scale);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)lqc_drawTopLine:(CGFloat)left width:(CGFloat)width
{
    [self lqc_buildTopLine];
    
    UIView *topLine = [self lqc_sc_TopLine];
    [topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(1.0 / [UIScreen mainScreen].scale);
        make.top.mas_equalTo(0);
    }];
}

- (void)lqc_drawBottomLine:(CGFloat)left width:(CGFloat)width
{
    [self lqc_buildBottomLine];
    
    UIView *bottomLine = [self lqc_sc_bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(1.0 / [UIScreen mainScreen].scale);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)lqc_drawSeparateLinesWithSelfIndex:(NSInteger)index
                             totalRows:(NSInteger)totalRows
                      bottomLeftMargin:(CGFloat)bottomLeftMargin
{
    if (index < 0 || totalRows < 1 || index > (totalRows - 1)) return;
    if (bottomLeftMargin < 0.0f) bottomLeftMargin = 0.0f;
    
    BOOL first = (index == 0);
    BOOL last = (index == totalRows - 1);
    [self lqc_drawTopLine:0 right:0];
    [self lqc_topLineHidden:!first];
    CGFloat left = last ? 0 : bottomLeftMargin;
    [self lqc_drawBottomLine:left right:0];
    [self lqc_bottomLineHidden:NO];
}

- (void)lqc_drawSeparateLinesWithSelfIndex:(NSInteger)index
                             totalRows:(NSInteger)totalRows
                      bottomLeftMargin:(CGFloat)bottomLeftMargin
                                 width:(CGFloat)fullWidth
{
    if (index < 0 || totalRows < 1 || index > (totalRows - 1)) return;
    if (bottomLeftMargin < 0.0f) bottomLeftMargin = 0.0f;
    if (fullWidth <= 0) fullWidth = 0.0f;
    
    BOOL first = (index == 0);
    BOOL last = (index == totalRows - 1);
    [self lqc_drawTopLine:0 width:fullWidth];
    [self lqc_topLineHidden:!first];
    CGFloat left = last ? 0 : bottomLeftMargin;
    [self lqc_drawBottomLine:left width:fullWidth - left];
    [self lqc_bottomLineHidden:NO];
}

- (void)lqc_topLineHidden:(BOOL)hidden
{
    if (![[self lqc_sc_TopLine] isKindOfClass:[UIView class]]) return;
    
    UIView *topLine = [self lqc_sc_TopLine];
    topLine.hidden = hidden;
    if (!hidden){
        [self bringSubviewToFront:topLine];
    }
}

- (void)lqc_bottomLineHidden:(BOOL)hidden
{
    if (![[self lqc_sc_bottomLine] isKindOfClass:[UIView class]]) return;
    UIView *bottomLine = [self lqc_sc_bottomLine];
    bottomLine.hidden = hidden;
    if (!hidden){
        [self bringSubviewToFront:bottomLine];
    }
}


#pragma mark - privite

- (void)lqc_buildTopLine{
    
    if ([[self lqc_sc_TopLine] isKindOfClass:[UIView class]]) return;
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:topLine];
    [self lqc_setSc_TopLine:topLine];
}


- (void)lqc_buildBottomLine{
    
    if ([[self lqc_sc_bottomLine] isKindOfClass:[UIView class]]) return;
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bottomLine];
    [self lqc_setSc_bottomLine:bottomLine];
}

#pragma mark - setter and getter

/* topLine's setter and getter   */

static char *const sc_topLineKey = "sc_topLineKey";

- (void)lqc_setSc_TopLine:(UIView *)sc_TopLine{
    [self willChangeValueForKey:@"sc_TopLine"];
    objc_setAssociatedObject(self,
                             &sc_topLineKey,
                             sc_TopLine,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"sc_TopLine"];
}

- (UIView *)lqc_sc_TopLine{
    return objc_getAssociatedObject(self, &sc_topLineKey);
}

/* bottomLine's setter and getter   */

static char *const sc_bottomLineKey = "sc_bottomLineKey";

- (void)lqc_setSc_bottomLine:(UIView *)sc_bottomLine{
    [self willChangeValueForKey:@"sc_bottomLine"];
    objc_setAssociatedObject(self,
                             &sc_bottomLineKey,
                             sc_bottomLine,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"sc_bottomLine"];
}

- (UIView *)lqc_sc_bottomLine{
    return objc_getAssociatedObject(self,
                                    &sc_bottomLineKey);
}


- (void)lqc_setSeparateColor:(UIColor *)color{
    if (![self lqc_sc_TopLine]){
        [self lqc_buildTopLine];
    }
    
    if (![self lqc_sc_bottomLine]){
        [self lqc_buildBottomLine];
    }
    
    [self lqc_sc_TopLine].backgroundColor = color;
    [self lqc_sc_bottomLine].backgroundColor = color;
}




@end

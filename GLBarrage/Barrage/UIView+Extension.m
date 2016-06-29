//
//  UIView+Extension.m
//  GLBarrage
//
//  Created by 66 on 16/6/28.
//  Copyright © 2016年 genju. All rights reserved.
//

#import "UIView+Extension.h"
#define DefaultAnimationTime 0.3

@implementation UIView (Extension)

- (void)setHidden:(BOOL)hidden animation:(BOOL)animation{
    if (animation) {
        if (!hidden) {
            [self setHidden:NO];
        }
        [UIView animateWithDuration:DefaultAnimationTime delay:0 usingSpringWithDamping:5 initialSpringVelocity:10 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.alpha = hidden ? 0 : 1;
        } completion:^(BOOL finished) {
            if (hidden) {
                [self setHidden:YES];
            }
        }];
    }else{
        self.alpha = hidden ? 0 : 1;
        self.hidden = hidden;
    }
}

- (void)addFadeAnimation {
    [self.layer addFadeAnimation];
}

- (void)addRotateAnimation {
    [self.layer addRotateAnimation];
}

- (void)removeRotateAnimation {
    [self.layer removeRotateAnimation];
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end

@implementation CALayer(extension)
- (void)addFadeAnimation
{
    CATransition *transition = [[CATransition alloc] init];
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.duration = DefaultAnimationTime;
    transition.type = kCATransitionFade;
    [self addAnimation:transition forKey:@"fadeAnimation"];
}
- (void)addRotateAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2.0 * M_PI);
    animation.duration  =  1;
    animation.autoreverses = NO;
    animation.cumulative = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    [self addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)removeRotateAnimation{
    [self removeAnimationForKey:@"rotateAnimation"];
}

@end

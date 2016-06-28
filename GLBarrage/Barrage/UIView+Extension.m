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

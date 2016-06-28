//
//  UIView+Extension.h
//  GLBarrage
//
//  Created by 66 on 16/6/28.
//  Copyright © 2016年 genju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  set hide
 *
 *  @param hidden    isHide
 *  @param animation isAnimatie
 */
- (void)setHidden:(BOOL)hidden animation:(BOOL)animation;
/**
 * add fade  Animation
 */
- (void)addFadeAnimation;
/**
 * add Rotate Animation
 */
- (void)addRotateAnimation;
/**
 * remove Animation
 */
- (void)removeRotateAnimation;

@end
@interface CALayer(extension)
- (void)addFadeAnimation;
- (void)addRotateAnimation;
- (void)removeRotateAnimation;
@end



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



@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;

@end
@interface CALayer(extension)
- (void)addFadeAnimation;
- (void)addRotateAnimation;
- (void)removeRotateAnimation;
@end



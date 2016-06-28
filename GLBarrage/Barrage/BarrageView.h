//
//  BarrageView.h
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarrageView : UIView
/**
 *  init
 *
 *  @param frame view frame
 *
 *  @return view
 */
- (instancetype)initWithFrame:(CGRect)frame;
/**
 *  start animation
 */
- (void)beginAnimation;
/**
 *  pause animation
 */
- (void)pauseAnimation;
/**
 *  stop animation
 */
- (void)stopAnimation;

@end

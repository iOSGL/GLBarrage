//
//  BarrageView.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import "BarrageView.h"

@implementation BarrageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

@end

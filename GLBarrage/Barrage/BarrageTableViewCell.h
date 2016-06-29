//
//  BarrageTableViewCell.h
//  GLBarrage
//
//  Created by 66 on 16/6/28.
//  Copyright © 2016年 genju. All rights reserved.
//


#import <UIKit/UIKit.h>

#define DefaultCellHeight 44.0
#define MAIN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define BarrageCellContentMaxWidth (MAIN_WIDTH*2/3)

@interface BarrageTableViewCell : UITableViewCell
/**
 *    initialization
 *
 *  @param tableView tableView
 *
 *  @return barrageTableViewcell
 */
+ (instancetype)cellForTableView:(UITableView *)tableView;

@property (nonatomic, assign) CGRect rect;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger randomNumber;

@end

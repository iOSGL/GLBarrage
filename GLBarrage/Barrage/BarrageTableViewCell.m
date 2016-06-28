//
//  BarrageTableViewCell.m
//  GLBarrage
//
//  Created by 66 on 16/6/28.
//  Copyright © 2016年 genju. All rights reserved.
//
#import <YYKit.h>

#import "BarrageTableViewCell.h"

@interface BarrageTableViewCell ()

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation BarrageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - View Life Cycle

+ (instancetype)cellForTableView:(UITableView *)tableView {
    static NSString *identifier = @"Cell";
    BarrageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BarrageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

#pragma mark - Private Method

- (void)configUI {
    [self addSubview:self.contentLabel];
    [self addSubview:self.iconImageView];
}

- (void)addConstraint {

}

#pragma mark - Setter Getter 

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [UILabel new];
        _contentLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.layer.cornerRadius = _contentLabel.height / 2;
        _contentLabel.layer.masksToBounds = YES;
    }
    return _contentLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

@end

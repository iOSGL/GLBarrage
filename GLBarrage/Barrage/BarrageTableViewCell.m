//
//  BarrageTableViewCell.m
//  GLBarrage
//
//  Created by 66 on 16/6/28.
//  Copyright © 2016年 genju. All rights reserved.
//
#import "UIView+Extension.h"

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
        [self configUI];

    }
    return self;
}

- (void)setContent:(NSString *)content {
    self.contentLabel.text = content;
    _rect.size.height = DefaultCellHeight;
    _rect.origin.y = 5;
    UIEdgeInsets inset = UIEdgeInsetsZero;

    if ((self.randomNumber % 2) == 0) {
        _rect.origin.x = 10;
        inset = UIEdgeInsetsMake(0, _rect.size.height+5, 3, 10);
        self.iconImageView.left = 0;
    } else {
        inset = UIEdgeInsetsMake(0, 10, 3, _rect.size.height+5);
        self.iconImageView.right = self.contentLabel.width;
    }
}


#pragma mark - Private Method

- (void)configUI {
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel addSubview:self.iconImageView];
}



#pragma mark - Setter Getter 

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, BarrageCellContentMaxWidth, DefaultCellHeight)];
        _contentLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.layer.cornerRadius = DefaultCellHeight / 2;
        _contentLabel.clipsToBounds = YES;
    }
    return _contentLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        _iconImageView.image = [UIImage imageNamed:@"image1"];
    }
    return _iconImageView;
}



@end

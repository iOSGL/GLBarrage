//
//  BarrageView.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import <YYKit.h>

#import "BarrageView.h"

#define BarrageAnimationTime 1.5

@interface BarrageView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSTimer *animationTimer;

@end

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
        __weak BarrageView *wself = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [wself createData];
            dispatch_async(dispatch_get_main_queue(), ^{
                [wself configUI];
            });
        });

    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - Open Method

- (void)beginAnimation {
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:BarrageAnimationTime block:^(NSTimer * _Nonnull timer) {

        NSLog(@"111111");

    } repeats:YES];
}

#pragma mark - Private Method

- (void)configUI {
    [self addSubview:self.tableView];
}

- (void)createData {
    self.dataArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i ++) {
        NSString *title = [NSString stringWithFormat:@"%zi",i + 1];
        [self.dataArray addObject:title];
    }

}

#pragma mark - Setter Getter 

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end

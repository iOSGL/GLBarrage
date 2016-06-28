//
//  BarrageView.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import <YYKit.h>
#import "UIView+extension.h"

#import "BarrageView.h"

#define BarrageAnimationTime 1.5
#define DefaultAnimationTime 0.3
#define BeginLock(_lock) dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
#define UnLock(_lock)    dispatch_semaphore_signal(_lock);

@interface BarrageView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *sourceArray;

@property (nonatomic, assign) NSInteger currtentRow;

@property (nonatomic, strong) NSTimer *animationTimer;

@end

@implementation BarrageView

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
    __weak BarrageView *wself = self;
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:BarrageAnimationTime block:^(NSTimer * _Nonnull timer) {
        [wself animationLoop];
    } repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.animationTimer forMode:NSRunLoopCommonModes];
}

- (void)pauseAnimation {
    [self timerInvalidate];
}

- (void)stopAnimation {
    [self timerInvalidate];
    self.currtentRow = 0;
    __weak BarrageView *wself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(BarrageAnimationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wself clearBarrage];
    });
}


#pragma mark - Private Method

- (void)configUI {
    [self addSubview:self.tableView];
}

- (void)animationLoop {
    if (self.currtentRow > self.sourceArray.count) {
        return;
    }
    [self.tableView beginUpdates];
    [self.dataArray addObject:self.sourceArray[self.currtentRow]];
    [self.tableView insertRow:self.currtentRow inSection:0 withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    if (self.tableView.contentSize.height - _tableView.height > _tableView.contentOffset.y) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:MAX(self.currtentRow - 4, 0) inSection:0]];
        cell.alpha = 0;
        [cell addFadeAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(BarrageAnimationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cell.alpha = 1;
        });

    }
    self.currtentRow ++;

}

- (void)timerInvalidate {
    if (self.animationTimer.isValid) {
        [self.animationTimer invalidate];
        self.animationTimer = nil;
    }
}

- (void)clearBarrage {
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    self.tableView.contentOffset = CGPointZero;
    [self setHidden:YES animation:NO];
}

- (void)createData {
    self.sourceArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i ++) {
        NSString *title = [NSString stringWithFormat:@"%zi",i + 1];
        [self.sourceArray addObject:title];
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

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end

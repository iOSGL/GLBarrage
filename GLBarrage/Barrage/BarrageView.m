//
//  BarrageView.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

//#import <YYKit.h>
#import "UIView+extension.h"

#import "BarrageView.h"
#import "BarrageTableViewCell.h"

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
    BarrageTableViewCell *cell = [BarrageTableViewCell cellForTableView:tableView];
    cell.randomNumber = arc4random() % 20;
    cell.content = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DefaultCellHeight;
}

#pragma mark - Open Method

- (void)beginAnimation {
    [self setHidden:NO animation:YES];
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:BarrageAnimationTime target:self selector:@selector(animationLoop) userInfo:nil repeats:YES];
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
    if (self.currtentRow >= self.sourceArray.count) {
        [self stopAnimation];
        return;
    }
    [self.tableView beginUpdates];
    [self.dataArray addObject:self.sourceArray[self.currtentRow]];
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:self.currtentRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[toInsert] withRowAnimation:UITableViewRowAnimationFade];

    [self.tableView endUpdates];
    if (self.tableView.contentSize.height - _tableView.height > _tableView.contentOffset.y) {
        [self.tableView setContentOffset:CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y+DefaultCellHeight) animated:YES];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:MAX(self.currtentRow - [self getNumberOFLine], 0) inSection:0]];
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
    [self setHidden:YES animation:YES];
}

- (void)createData {
    self.sourceArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i ++) {
        NSString *title = [NSString stringWithFormat:@"%zi",i + 1];
        [self.sourceArray addObject:title];
    }

}

- (NSInteger)getNumberOFLine {
    NSInteger module = fmodf(self.tableView.height, DefaultCellHeight);
    NSInteger numberLineCount = self.tableView.height / DefaultCellHeight;
    if (module == 0) {
        return numberLineCount;
    } else {
        return numberLineCount + 1;
    }
}

#pragma mark - Setter Getter 

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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

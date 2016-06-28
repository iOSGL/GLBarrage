//
//  ViewController.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import <YYKit.h>
#import <Masonry.h>
#import "ViewController.h"
#import "BarrageView.h"

#define MAIN_WIDTH  [UIScreen mainScreen].bounds.size.width

#define MAIN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) BarrageView *barrageView;

@property (nonatomic, strong) UIButton *startBtn;

@property (nonatomic, strong) UIButton *stopBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"main";
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.barrageView];
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.stopBtn];
}

- (void)viewWillLayoutSubviews {
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-110);
        make.size.mas_equalTo(CGSizeMake(50, 50));

    }];
    [self.stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.size.mas_equalTo(CGSizeMake(50, 50));

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Pravite Method
- (void)addSubview {
    NSString *className = @"BarrageView";
    Class targetClass = NSClassFromString(className);
    if (targetClass) {
        id view = [[targetClass alloc]initWithFrame:CGRectMake(0, 100, MAIN_WIDTH, 200)];
        [self.view addSubview:view];
    }
}

#pragma mark - Button Events

- (void)starAnimationAction:(UIButton *)sender {
    [self.barrageView beginAnimation];
}

- (void)stopAnimationAction:(UIButton *)sender {
    [self.barrageView pauseAnimation];
}

#pragma mark - Setter Getter 

- (BarrageView *)barrageView {
    if (_barrageView == nil) {
        _barrageView = [[BarrageView alloc]initWithFrame:CGRectMake(0, 100, MAIN_WIDTH, 200)];
    }
    return _barrageView;
}

- (UIButton *)startBtn {
    if (_startBtn == nil) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.backgroundColor = [UIColor orangeColor];
        [_startBtn setTitle:@"开始" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        [_startBtn addTarget:self action:@selector(starAnimationAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIButton *)stopBtn {
    if (_stopBtn == nil) {
        _stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _stopBtn.backgroundColor = [UIColor orangeColor];
        [_stopBtn setTitle:@"结束" forState:UIControlStateNormal];
        [_stopBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        [_stopBtn addTarget:self action:@selector(stopAnimationAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopBtn;
}


@end

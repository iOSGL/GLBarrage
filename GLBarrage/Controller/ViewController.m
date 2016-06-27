//
//  ViewController.m
//  GLBarrage
//
//  Created by 66 on 16/6/27.
//  Copyright © 2016年 genju. All rights reserved.
//

#import "ViewController.h"
#import "BarrageView.h"

#define MAIN_WIDTH  [UIScreen mainScreen].bounds.size.width

#define MAIN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) BarrageView *barrageView;

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

#pragma mark - Setter Getter 

- (BarrageView *)barrageView {
    if (_barrageView == nil) {
        _barrageView = [[BarrageView alloc]initWithFrame:CGRectMake(0, 100, MAIN_WIDTH, 200)];
    }
    return _barrageView;
}


@end

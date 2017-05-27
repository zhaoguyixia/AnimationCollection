//
//  LoadRateViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "LoadRateViewController.h"
#import "LoadingView.h"
#import "SecondLoadingView.h"

@interface LoadRateViewController ()
{
    NSTimer *timer;
    float progress;
}
//loadView是系统的一个方法的名字，不要使用
@property (nonatomic, strong) LoadingView *loadingView;
@property (nonatomic, strong) SecondLoadingView *secondLoadView;
@end

@implementation LoadRateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"进度条";
    self.view.backgroundColor = [UIColor blackColor];
    [self handleUI];
}

- (void)handleUI
{
    
    self.loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.loadingView.center = self.view.center;
    [self.view addSubview:self.loadingView];
    
    self.secondLoadView = [[SecondLoadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.secondLoadView.centerX = SCREENW/2.0;
    self.secondLoadView.top = self.loadingView.bottom + 50;
    [self.view addSubview:self.secondLoadView];
}
//
- (void)initTimer
{
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(startLoad) userInfo:nil repeats:YES];
    }
    [timer fireDate];
}

- (void)startAnimate
{
//    [super startAnimate];
    [self initTimer];
    [self.secondLoadView startAnimation];
}

- (void)startLoad
{
    progress += 0.01;
    NSLog(@"%g", progress);
    if (progress <= 1.01)
    {
        self.loadingView.progress = progress;
    }
    else
    {
        [timer invalidate];
        timer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

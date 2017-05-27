//
//  FreeDownViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//
#define rate 0.6 //每次撞地之后能量为原来的百分比
#import "FreeDownViewController.h"
#import "FreeDownAnimation.h"

@interface FreeDownViewController ()<FreeDownAnimationDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation FreeDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自由落体";
    [self handleUI];
}

- (void)handleUI
{
    self.imageView                    = [HPUITools createImageView:CGRectMake(0, 65, 50, 50) andBackgroundImage:nil];
    self.imageView.backgroundColor    = [UIColor cyanColor];
    self.imageView.layer.cornerRadius = self.imageView.width/2.0;
    self.imageView.centerX = SCREENW/2.0;
    [self.view addSubview:self.imageView];
}

- (void)startAnimate
{
    [super startAnimate];
    self.imageView.top         = 65;
    FreeDownAnimation *animate = [[FreeDownAnimation alloc] init];
    animate.delegate           = self;
    [animate freeDownAnimation:self.imageView andEndY:SCREENH-200];
}

- (void)animationDidFinished
{
    NSLog(@"动画结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

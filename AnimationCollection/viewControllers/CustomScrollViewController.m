//
//  CustomScrollViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2018/4/22.
//  Copyright © 2018年 limingfeng. All rights reserved.
//

#import "CustomScrollViewController.h"
#import "CustomScrollView.h"
#import "MyLabel.h"
@interface CustomScrollViewController ()
@property (nonatomic, strong) MyLabel *label;
@property (nonatomic, strong) CustomScrollView *scrollView;
@end

@implementation CustomScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.label = [[MyLabel alloc] initWithFrame:CGRectMake(0, 64, SCREENW, (self.view.height-64)/2.0)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor cyanColor];
    self.label.font = [UIFont fontWithName:@"PingFangSC-Thin" size:17];
    self.label.text = @"我是底部label";
    self.label.numberOfLines = 0;
    self.label.userInteractionEnabled = YES;
    [self.view addSubview:self.label];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scrollHead:)];
    [self.label addGestureRecognizer:pan];
    
//    __weak typeof(self) weakSelf = self;
    self.scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREENW, self.view.height-64)];
    [self.view addSubview:self.scrollView];
}

- (void)scrollHead:(UIPanGestureRecognizer *)gesture{
    CGPoint point = [gesture translationInView:self.view];
    NSLog(@"%f", point.y);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了控制器");
//    [self.scrollView touchesBegan:touches withEvent:event];
    [self.label touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.label touchesMoved:touches withEvent:event];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  KeyPathAnimationViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "KeyPathAnimationViewController.h"
#import "KeyPathAnimationView.h"

@interface KeyPathAnimationViewController ()
@property (nonatomic, strong) KeyPathAnimationView *animationView;
@end

@implementation KeyPathAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animationView = [[KeyPathAnimationView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:self.animationView];
}

- (void)startAnimate
{
    [self.animationView startSpade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

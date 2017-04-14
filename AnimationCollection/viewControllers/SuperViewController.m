//
//  SuperViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *rightBtn = [HPUITools createButton:CGRectMake(0, 0, 60, 44) andBackgroundColor:nil andImage:nil andTarget:self andAction:@selector(startAnimate) andTitleColor:[UIColor blackColor] andFont:17.0 andTitle:@"开始"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)startAnimate
{
    
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

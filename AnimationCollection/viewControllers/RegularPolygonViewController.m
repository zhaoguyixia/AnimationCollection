//
//  RegularPolygonViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "RegularPolygonViewController.h"
#import "RegularPolygonView.h"
#import "RegularPolygonPointFactory.h"

@interface RegularPolygonViewController ()

@end

@implementation RegularPolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"正多边形";
    [self createUI];
}

- (void)createUI
{
    RegularPolygonPointFactory *factory = [[RegularPolygonPointFactory alloc] init];
    factory.numbersOfMargin = 6;
    factory.startAngle = 0;
    factory.radius = 40;
    factory.centerPoint = CGPointMake(50, 50);
    RegularPolygonView *view = [[RegularPolygonView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.pointArray = [factory producePointArray];
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

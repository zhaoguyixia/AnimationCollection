//
//  MainViewController.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()<MainViewDelegate>
@property (nonatomic, strong) MainView *mainView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画集合";
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleUI];
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [NSMutableArray array];
        NSArray *array = @[
                           @"FreeDownViewController",
                           @"LoadRateViewController",
                           @"KeyPathAnimationViewController",
                           @"PromtViewController"];
        for (NSString *str in array)
        {
            MainModel *model = [[MainModel alloc] initWithString:str];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}

- (void)handleUI
{
    self.mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64)];
    self.mainView.delegate = self;
    [self.view addSubview:self.mainView];
    [self.mainView setData:self.dataSource];
}


- (void)tableViewCellDidSelected:(MainModel *)model
{
    Class obj = NSClassFromString(model.className);
    if (obj ==  nil)
    {
        NSLog(@"不存在这样的视图");
        return;
    }
    UIViewController *view = [[obj alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

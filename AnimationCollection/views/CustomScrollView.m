//
//  CustomScrollView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2018/4/22.
//  Copyright © 2018年 limingfeng. All rights reserved.
//

#import "CustomScrollView.h"
#import "CustomTableView.h"

@interface CustomScrollView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CustomTableView *tableView;
@property (nonatomic, strong) UIView *headView;
@end

@implementation CustomScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2.0)];
//    [self.headView addTap:self andSel:@selector(clickHead:)];
//    self.tableView = [HPUITools createTableView:self.bounds
//                              andTableViewStyle:UITableViewStylePlain
//                             andBackgroundColor:nil
//                              andShowBottomLine:NO
//                                  andDataSource:self
//                                    andDelegate:self
//                               andShowIndicator:UITableViewNone];
    
    self.tableView = [[CustomTableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.tableHeaderView = self.headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%li个cell", indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你点击的是第%li个cell", indexPath.row);
}
- (void)clickHead:(UITapGestureRecognizer *)gesture{
    if (self.tapBlock) {
        self.tapBlock(gesture);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"你点击了滑动view");
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
}

@end

//
//  MainView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "MainView.h"
#import "MainCell.h"

@interface MainView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createUI:frame];
    }
    return self;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)createUI:(CGRect)frame
{
    self.tableView = [HPUITools createTableView:self.bounds andTableViewStyle:UITableViewStylePlain andBackgroundColor:nil andShowBottomLine:NO andDataSource:self andDelegate:self andShowIndicator:UITableViewNone];
    [self addSubview:self.tableView];
}
#pragma mark --刷新数据源
- (void)setData:(NSArray *)dataArray
{
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:dataArray];
    [self.tableView reloadData];
}
#pragma mark --tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if (cell == nil)
    {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    if ([self.dataSource count])
    {
        [cell config:[self.dataSource objectAtIndex:indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= [self.dataSource count])
    {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(tableViewCellDidSelected:)])
    {
        [_delegate tableViewCellDidSelected:[self.dataSource objectAtIndex:indexPath.row]];
    }
}
@end

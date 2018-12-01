//
//  CustomTableView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2018/4/22.
//  Copyright © 2018年 limingfeng. All rights reserved.
//

#import "CustomTableView.h"

@interface CustomTableView()
@property (nonatomic, strong) UIView *headView;
@end

@implementation CustomTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = [UIColor clearColor];
//        self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2.0)];
//        self.tableHeaderView = self.headView;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self superview] touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self superview] touchesMoved:touches withEvent:event];
}

@end

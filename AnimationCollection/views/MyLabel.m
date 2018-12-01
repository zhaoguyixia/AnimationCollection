//
//  MyLabel.m
//  AnimationCollection
//
//  Created by 李明锋 on 2018/4/22.
//  Copyright © 2018年 limingfeng. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self addTap:self andSel:@selector(clickMe)];
    }
    return self;
}
- (void)clickMe{
    NSLog(@"你点击了label");
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"终极响应");
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"你点击了label");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"label在滑动");
}
@end

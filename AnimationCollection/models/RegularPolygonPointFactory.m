//
//  RegularPolygonPointFactory.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "RegularPolygonPointFactory.h"

@interface RegularPolygonPointFactory ()
{
    //记录是否设置了边数
    BOOL ifSetNumber;
    //记录是否设置了开始角度
    BOOL ifSetAngle;
    //记录是否设置了半径
    BOOL ifSetRadius;
    //记录是否设置了中心点
    BOOL ifSetCenter;
    NSInteger setTimes;
}
@end

@implementation RegularPolygonPointFactory
- (instancetype)init
{
    if (self = [super init])
    {
        ifSetAngle           = NO;
        ifSetNumber          = NO;
        ifSetRadius          = NO;
        setTimes             = 0;
        self.numbersOfMargin = 3;
        self.startAngle      = 0;
        self.radius          = 20;
        self.centerPoint = (CGPoint){self.radius, self.radius};
    }
    return self;
}
- (NSMutableArray *)producePointArray
{
    if (setTimes < 4)
    {
        NSLog(@"还有一些参数没有进行设置");
    }
    NSMutableArray *pointArray = [NSMutableArray array];
    //边数
    NSInteger lineNumber       = self.numbersOfMargin;
    float perAngle             = 360/lineNumber;
    //开始角度
    float startAngle = self.startAngle;
    //半径
    float radius     = self.radius;
    for (int i=0; i<lineNumber; i++)
    {
        float angle   = (startAngle+i*perAngle)*M_PI/180;
        //多边形外围点
        CGPoint point = CGPointMake(radius*sinf(angle)+self.centerPoint.x, -radius*cosf(angle)+self.centerPoint.y);
        [pointArray addObject:[NSValue valueWithCGPoint:point]];
    }
    return pointArray;
}
- (void)setNumbersOfMargin:(NSInteger)numbersOfMargin
{
    if (numbersOfMargin < 3)
    {
        numbersOfMargin = 3;
    }
    ifSetNumber      = YES;
    _numbersOfMargin = numbersOfMargin;
    setTimes         = ifSetNumber+ifSetRadius+ifSetAngle+ifSetCenter;
}
- (void)setStartAngle:(float)startAngle
{
    ifSetAngle  = YES;
    _startAngle = startAngle;
    setTimes    = ifSetNumber+ifSetRadius+ifSetAngle+ifSetCenter;
}
- (void)setRadius:(float)radius
{
    ifSetRadius = YES;
    _radius     = radius;
    setTimes    = ifSetNumber+ifSetRadius+ifSetAngle+ifSetCenter;
}
- (void)setCenterPoint:(CGPoint)centerPoint
{
    ifSetCenter  = YES;
    _centerPoint = CGPointMake(centerPoint.x, centerPoint.y);
    setTimes     = ifSetNumber+ifSetRadius+ifSetAngle+ifSetCenter;
}
@end

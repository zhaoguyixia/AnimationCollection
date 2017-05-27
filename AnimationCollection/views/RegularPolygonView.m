//
//  RegularPolygonView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "RegularPolygonView.h"

@implementation RegularPolygonView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    if ([self.pointArray count])
    {
        for (int i=0; i<=[self.pointArray count]; i++)
        {
            CGPoint A = [self.pointArray[i%[self.pointArray count]] CGPointValue];
            if (i==0)
            {
                CGContextMoveToPoint(ref, A.x, A.y);
            }
            else
            {
                CGContextAddLineToPoint(ref, A.x, A.y);
            }
        }
    }
    CGContextSetRGBFillColor(ref, 0.5, 0.5, 0.5, 1.0);
    CGContextFillPath(ref);
}
@end

//
//  UIView+Additions.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)
- (CGFloat)top
{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y+self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x+self.frame.size.width;
}
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark --设置y轴旋转角度
+ (CATransform3D)ratoteAngle:(float)angle
{
    angle = angle*M_PI/180.0;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 2.5/-2000;
    transform = CATransform3DRotate(transform, -angle, 0, 1, 0);
    return transform;
}

- (void)setShadowWithOffset:(CGSize)size andRadius:(CGFloat)radius andOpacity:(CGFloat)opacity andColor:(UIColor *)color
{
    //    view.layer.shadowPath = [[UIBezierPath bezierPathWithRect:view.bounds] CGPath];
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
}

- (void)addTap:(id)target andSel:(SEL)sel
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:sel];
    [self addGestureRecognizer:tap];
}

@end

//
//  KeyPathAnimationView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "KeyPathAnimationView.h"

@interface KeyPathAnimationView ()
@property (nonatomic, strong) UIView *animationView;
@end

@implementation KeyPathAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor cyanColor];
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.animationView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 10)];
    self.animationView.backgroundColor = [UIColor redColor];
    [self addSubview:self.animationView];
    
}

- (void)startSpade
{
    self.animationView.transform      = CGAffineTransformIdentity;
    self.animationView.transform      = CGAffineTransformMakeRotation(90*M_PI/180.0);
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path                 = [self getBezierPath].CGPath;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyAnimation.duration             = 3.0;
    keyAnimation.repeatCount          = 1;
    keyAnimation.autoreverses         = NO;
    keyAnimation.calculationMode      = kCAAnimationCubicPaced;
    //设置控件与运动轨迹相切，但是有一个规则，正常情况下控件的底部与轨迹相切，所以需要让左边或者右边与轨迹相切时，需要旋转控件
    keyAnimation.rotationMode         = kCAAnimationRotateAuto;
    //如果想让控件运动完成后保持最终的状态需要将fillmode 设置为  kCAFillModeBackwards 或者 kCAFillModeBoth，但是removeedOnCompletion必须要设置为no,fillemode才会有效果
    keyAnimation.removedOnCompletion  = NO;
    keyAnimation.fillMode = kCAFillModeBoth;
    [self.animationView.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self startSpade];
}

- (UIBezierPath *)getBezierPath
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGPoint startPoint       = CGPointMake(10, self.frame.size.height/2.0);
    CGPoint centerPoint      = CGPointMake(self.frame.size.width/2.0, 10);
    CGPoint endPoint         = CGPointMake(self.frame.size.width-10, self.frame.size.height/2.0);
    [bezierPath moveToPoint:startPoint];
    [bezierPath addQuadCurveToPoint:endPoint controlPoint:centerPoint];
    return bezierPath;
}

- (void)drawRect:(CGRect)rect
{
    UIColor *color           = [UIColor blackColor];
    [color set];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGPoint startPoint       = CGPointMake(10, self.frame.size.height/2.0);
    CGPoint centerPoint      = CGPointMake(self.frame.size.width/2.0, 10);
    CGPoint endPoint         = CGPointMake(self.frame.size.width-10, self.frame.size.height/2.0);
    [bezierPath moveToPoint:startPoint];
    [bezierPath addQuadCurveToPoint:endPoint controlPoint:centerPoint];
    [bezierPath setLineWidth:2.0];
    bezierPath.lineCapStyle  = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    [bezierPath stroke];
}

@end

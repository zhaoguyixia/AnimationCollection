//
//  SecondLoadingView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "SecondLoadingView.h"

@interface SecondLoadingView ()<CAAnimationDelegate>
{
    CALayer *animationLayer;
}
@end

@implementation SecondLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor    = [UIColor whiteColor];
        self.layer.cornerRadius = self.width/2.0;
        animationLayer          = [CALayer layer];
        animationLayer.bounds   = self.bounds;
        animationLayer.position = CGPointMake(self.width/2.0, self.width/2.0);
        [self.layer addSublayer:animationLayer];
    }
    return self;
}

- (void)startAnimation
{
    CGFloat lineWidth = 4.0;
    //首先要移除circlelayer
    for (CAShapeLayer *layer in animationLayer.sublayers)
    {
        [layer removeFromSuperlayer];
    }
    
    CAShapeLayer *circleLayer       = [CAShapeLayer layer];
    circleLayer.frame               = animationLayer.bounds;
    circleLayer.fillColor           = [[UIColor whiteColor] CGColor];
    circleLayer.strokeColor         = [[UIColor cyanColor] CGColor];
    circleLayer.lineWidth           = lineWidth;
    circleLayer.lineCap             = kCALineCapRound;
    [animationLayer addSublayer:circleLayer];
    
    CGFloat radius                  = animationLayer.bounds.size.width/2.0-lineWidth;
    UIBezierPath *path              = [UIBezierPath bezierPathWithArcCenter:circleLayer.position
                                                                    radius:radius
                                                                 startAngle:-M_PI/2
                                                                   endAngle:M_PI*3/2
                                                                  clockwise:YES];
    circleLayer.path                = path.CGPath;

    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //设置动画时间
    baseAnimation.duration          = 3.0;
    //起始值
    baseAnimation.fromValue         = @(0.0f);
    //终止值
    baseAnimation.toValue           = @(1.0f);
    baseAnimation.delegate          = self;
    //
    [baseAnimation setValue:@"baseAnimation" forKey:@"animationName"];
    //key值最好加上
    [circleLayer addAnimation:baseAnimation forKey:@"circleAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"动画结束");
}

@end

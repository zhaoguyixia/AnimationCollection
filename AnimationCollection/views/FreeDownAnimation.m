//
//  FreeDownAnimation.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//
#define FreeDownRate 0.6
#import "FreeDownAnimation.h"

@interface FreeDownAnimation ()
{
    CGFloat g;       //重力加速度
    CGFloat time;    //时间
    CGFloat startV;  //初始速度
    CGFloat startH;  //初始高度
    CGFloat centerH; //
    CGFloat subH;    //高度差
    NSTimer *timer;  //定时器
    CGFloat viewEndBottom;//最终的y坐标
    UIView *animateView;
}
@end

@implementation FreeDownAnimation
- (void)dealloc
{
    NSLog(@"自由落体释放");
}
- (instancetype)init
{
    if (self = [super init])
    {
        g = 9.8;
        startV = 0;
        time = 0;
    }
    return self;
}

- (void)freeDownAnimation:(UIView *)view andEndY:(CGFloat)endY
{
    animateView   = view;
    startH        = animateView.bottom;
    viewEndBottom = endY;
    if (endY <= animateView.bottom)
    {
        NSLog(@"不符合自然规律，最终位置有误");
        return;
    }
    subH      = endY - animateView.bottom;
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(start) userInfo:nil repeats:YES];
    }
    [timer fire];
}

- (void)start
{
    /*
     要做自由落体运动，首先要确定一下几点：
     1.重力加速度，可以自定以一个重力加速度，在你的世界里，你就是王，可以随意修改自然法则。（不过通常用g=9.8m/s作为近似的加速度）
     2.起止坐标，确定y轴坐标就行了。
     3.因为要模拟真实的自由落体运动，所以需要计算反弹的动能转化，不考虑空气阻力，假设撞击地面的能量损耗为撞地前的(1-FreeDownRate)，在这种条件下的自由落体运动，损耗可以自定义。
     4.动能公式：Ek = m*v*v/2;
     5.重力势能转化为动能：Ek = mgh;其中g=9.8m/s
     */
    CGFloat endH           = viewEndBottom;
    //速度变化
    time                   += 0.01;
    //速度变化公式
    //    CGFloat endV = startV + time*g;
    //位移公式
    CGFloat endBottom      = startV*time+(g*time*time)/2.0+startH;
    animateView.bottom     = endBottom;
    if (animateView.bottom >= endH)
    {
        subH       = subH*FreeDownRate;
        startV     = -sqrtf(g*subH*2);
        time       = 0;
        startH     = animateView.bottom;
        if (startV == 0)
        {
            if ([self.delegate respondsToSelector:@selector(animationDidFinished)])
            {
                [_delegate animationDidFinished];
            }
            [timer invalidate];
            timer  = nil;
        }
        return;
    }
}

@end

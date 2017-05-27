//
//  LoadingView.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()
@property (nonatomic, strong) UILabel *progressLabel;
@end

@implementation LoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.progress = 0;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.progressLabel        = [HPUITools createLabelWithFrame:CGRectMake(0, 0, 50, 50) andBackgroundColor:nil andTextAlignment:NSTextAlignmentCenter andFont:17.0 andTextColor:[UIColor whiteColor] andText:@"0%"];
    self.progressLabel.center = self.center;
    [self addSubview:self.progressLabel];
}

- (void)setProgress:(float)progress
{
    progress  = floorf(progress * 100);
    _progress = progress;
    if (progress <= 100)
    {
//        NSLog(@"%g", progress);
        self.progressLabel.text = [NSString stringWithFormat:@"%g%@", progress, @"%"];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    UIColor *color      = [UIColor whiteColor];
    [color set];
    CGPoint centerPoint = CGPointMake(self.width/2.0, self.height/2.0);
    float lineWidth     = 2;
    float radius        = self.width/2.0-lineWidth*2;
    float endAngle      = self.progress/100.0*360.0*M_PI/180.0;
    UIBezierPath *path  = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:endAngle
                                                     clockwise:YES];
    [path setLineWidth:lineWidth];
    path.lineCapStyle   = kCGLineCapRound;
    path.lineJoinStyle  = kCGLineJoinRound;
    [path stroke];
}

@end

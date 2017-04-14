//
//  UIView+Additions.h
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

+ (CATransform3D)ratoteAngle:(float)angle;

- (void)setShadowWithOffset:(CGSize)size andRadius:(CGFloat)radius andOpacity:(CGFloat)opacity andColor:(UIColor *)color;

- (void)addTap:(id)target andSel:(SEL)sel;


@end

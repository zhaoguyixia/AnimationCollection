//
//  FreeDownAnimation.h
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FreeDownAnimationDelegate <NSObject>

@optional

/**
 动画结束
 */
- (void)animationDidFinished;

@end

@interface FreeDownAnimation : NSObject
@property (nonatomic, weak) id<FreeDownAnimationDelegate> delegate;
/**
 自由落体运动
 
 @param view 要作自由落体运动的控件
 */
- (void)freeDownAnimation:(UIView *)view andEndY:(CGFloat)endY;
@end

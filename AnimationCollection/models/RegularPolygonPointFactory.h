//
//  RegularPolygonPointFactory.h
//  AnimationCollection
//
//  Created by 李明锋 on 2017/5/27.
//  Copyright © 2017年 limingfeng. All rights reserved.
//
/*
    设置正多边形的边数、起始角度、半径，生成对应的多边形顶点坐标
 */
#import <Foundation/Foundation.h>

@interface RegularPolygonPointFactory : NSObject

/**
 边数，默认为3
 */
@property (nonatomic, assign) NSInteger numbersOfMargin;

/**
 半径，默认为20
 */
@property (nonatomic, assign) float radius;

/**
 开始角度，默认为0
 */
@property (nonatomic, assign) float startAngle;

/**
 中心点
 */
@property (nonatomic, assign) CGPoint centerPoint;
/**
 生产点的集合

 @return pointArray
 */
- (NSMutableArray *)producePointArray;
@end

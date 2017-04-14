//
//  MainView.h
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"

@protocol MainViewDelegate <NSObject>

@optional

/**
 选中某一行进行跳转

 @param model model存放目标controller的类名
 */
- (void)tableViewCellDidSelected:(MainModel *)model;

@end

@interface MainView : UIView
@property (nonatomic, weak) id<MainViewDelegate> delegate;

/**
 刷新数据源

 @param dataArray 数据源
 */
- (void)setData:(NSArray *)dataArray;
@end

//
//  CustomScrollView.h
//  AnimationCollection
//
//  Created by 李明锋 on 2018/4/22.
//  Copyright © 2018年 limingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIView
@property (nonatomic, copy) void(^tapBlock)(UITapGestureRecognizer *gesture);
@end

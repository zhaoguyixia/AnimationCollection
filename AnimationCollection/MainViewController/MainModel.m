//
//  MainModel.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
- (instancetype)initWithString:(NSString *)string
{
    if (self = [super init])
    {
        self.className = string;
    }
    return self;
}
- (instancetype)initWith:(id)class
{
    if (self = [super init])
    {
        self.className = [class className];
    }
    return self;
}
@end

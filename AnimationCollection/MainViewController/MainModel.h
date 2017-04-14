//
//  MainModel.h
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property (nonatomic, copy) NSString *className;
- (instancetype)initWithString:(NSString *)string;
//- (instancetype)initWith:(id)class;
@end

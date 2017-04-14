//
//  MainCell.m
//  AnimationCollection
//
//  Created by 李明锋 on 2017/4/14.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "MainCell.h"

@interface MainCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation MainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.label = [HPUITools createLabelWithFrame:CGRectMake(0, 0, SCREENW, 44) andBackgroundColor:nil andTextAlignment:NSTextAlignmentCenter andFont:17.0 andTextColor:[UIColor blackColor] andText:@"88"];
    [self.contentView addSubview:self.label];
    
    UIView *line = [HPUITools createView:CGRectMake(0, 43.5, SCREENW, 0.5) andBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:line];
}

- (void)config:(MainModel *)model
{
    self.label.text = model.className;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

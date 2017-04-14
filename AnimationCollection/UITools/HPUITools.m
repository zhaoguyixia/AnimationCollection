//
//  HPUITools.m
//  LMFImageBrowserSDKDemo
//
//  Created by wantexe on 17/3/7.
//  Copyright © 2017年 limingfeng. All rights reserved.
//

#import "HPUITools.h"

@implementation HPUITools
+ (UILabel *)createLabelWithFrame:(CGRect)frame andBackgroundColor:(UIColor *)baColor andTextAlignment:(NSTextAlignment)alignment andFont:(float)font andTextColor:(UIColor *)textColor andText:(NSString *)text
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (baColor)
    {
        label.backgroundColor = baColor;
    }
    label.clipsToBounds = YES;
    label.textAlignment = alignment;
    label.font = [UIFont fontWithName:@"PingFangSC-Thin" size:font];
    label.text = text;
    label.numberOfLines = 0;
    if (textColor)
    {
        label.textColor = textColor;
    }
    label.userInteractionEnabled = YES;
    return label;
}

+ (UIImageView *)createImageView:(CGRect)frame andBackgroundImage:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName)
    {
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.layer.masksToBounds = YES;
    imageView.userInteractionEnabled = YES;
    return imageView;
}

+ (UIButton *)createButton:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andImage:(NSString *)imageName andTarget:(id)target andAction:(SEL)sel andTitleColor:(UIColor *)titleColor andFont:(float)font andTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = bgColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if ([imageName length])
    {
        [button setBackgroundImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    return button;
}

+ (UIView *)createView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    view.backgroundColor = bgColor;
    return view;
}

+ (UITextField *)createTextField:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andSecurity:(BOOL)flag andDelegate:(id)delegate andPlaceholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.backgroundColor = bgColor;
    textField.secureTextEntry = flag;
    textField.delegate = delegate;
    textField.placeholder = placeholder;
    return textField;
}

+ (UITextView *)createTextView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andShowBorder:(BOOL)flag andDelegate:(id)delegate
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = bgColor;
    if (flag)
    {
        textView.layer.borderWidth = 0.5;
        textView.layer.borderColor = [[UIColor blackColor] CGColor];
    }
    textView.delegate = delegate;
    return textView;
}

+ (UITableView *)createTableView:(CGRect)frame andTableViewStyle:(UITableViewStyle)style andBackgroundColor:(UIColor *)bgColor andShowBottomLine:(BOOL)flag andDataSource:(id)dataSourceDelegate andDelegate:(id)delegate andShowIndicator:(UITableviewShowIndicator)showIndicator
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.backgroundColor = bgColor;
    if (!flag)
    {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    tableView.dataSource = dataSourceDelegate;
    tableView.delegate = delegate;
    switch (showIndicator)
    {
        case UITableViewHorizontal:
            tableView.showsHorizontalScrollIndicator = YES;
            tableView.showsVerticalScrollIndicator = NO;
            break;
        case UITableViewVertical:
            tableView.showsVerticalScrollIndicator = YES;
            tableView.showsHorizontalScrollIndicator = NO;
            break;
        case UITableViewNone:
            tableView.showsVerticalScrollIndicator = NO;
            tableView.showsHorizontalScrollIndicator = NO;
            break;
        default:
            break;
    }
    return tableView;
}

+ (UICollectionView *)createCollectionView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andScrollDirection:(UICollectionViewScrollDirection)scrollDirection andMiniLineSpacing:(NSInteger)lineSpacing andMiniInteritemSpacing:(NSInteger)interitemSpace andItemSize:(CGSize)size andDataSource:(id)dataSource andDelete:(id)delegate andRegisterClass:(NSString *)className
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = scrollDirection;
    layout.itemSize = size;
    layout.minimumLineSpacing = lineSpacing;
    layout.minimumInteritemSpacing = interitemSpace;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor blackColor];
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    collectionView.pagingEnabled = YES;
    collectionView.scrollsToTop = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
    return collectionView;
}
@end

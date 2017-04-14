//
//  HPUITools.h
//  LMFImageBrowserSDKDemo
//
//  Created by wantexe on 17/3/7.
//  Copyright © 2017年 limingfeng. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UITableviewShowIndicator){
    UITableViewVertical = 0,
    UITableViewHorizontal,
    UITableViewNone
};

@interface HPUITools : NSObject


/**
 create label

 @param frame CGRect
 @param baColor background color
 @param alignment style of word alignment
 @param font word size
 @param textColor word color
 @param text word
 @return label
 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame andBackgroundColor:(UIColor *)baColor andTextAlignment:(NSTextAlignment)alignment andFont:(float)font andTextColor:(UIColor *)textColor andText:(NSString *)text;

/**
 create imageview

 @param frame CGRect
 @param imageName imagename
 @return imageview
 */
+ (UIImageView *)createImageView:(CGRect)frame andBackgroundImage:(NSString *)imageName;

/**
 create button

 @param frame CGRect
 @param bgColor background color
 @param imageName imageName
 @param target who has the method
 @param sel method
 @param titleColor word color
 @param font word size
 @param title button title
 @return button
 */
+ (UIButton *)createButton:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andImage:(NSString *)imageName andTarget:(id)target andAction:(SEL)sel andTitleColor:(UIColor *)titleColor andFont:(float)font andTitle:(NSString *)title;

/**
 create UIview

 @param frame CGRect
 @param bgColor background color
 @return UIView
 */
+ (UIView *)createView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor;

/**
 create textfield

 @param frame CGRect
 @param bgColor background color
 @param flag if use password
 @param delegate delegate
 @param placeholder default word
 @return textfield
 */
+ (UITextField *)createTextField:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andSecurity:(BOOL)flag andDelegate:(id)delegate andPlaceholder:(NSString *)placeholder;

/**
 create textview

 @param frame CGRect
 @param bgColor background color
 @param flag if show border,width default 0.5 point,color is black
 @param delegate delegate
 @return textview
 */
+ (UITextView *)createTextView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andShowBorder:(BOOL)flag andDelegate:(id)delegate;

/**
 create tableview

 @param frame CGRect
 @param style UITableViewStyle plain or group
 @param bgColor background color
 @param flag if show bottom line
 @param dataSourceDelegate dataSource delegate
 @param delegate delegate
 @param showIndicator show indicator dirction:vertical or horizontal or none
 @return tableview
 */
+ (UITableView *)createTableView:(CGRect)frame andTableViewStyle:(UITableViewStyle)style andBackgroundColor:(UIColor *)bgColor andShowBottomLine:(BOOL)flag andDataSource:(id)dataSourceDelegate andDelegate:(id)delegate andShowIndicator:(UITableviewShowIndicator)showIndicator;

/**
 create collectionView

 @param frame CGRect
 @param bgColor background color
 @param scrollDirection scroll direction
 @param lineSpacing mini line spacing
 @param interitemSpace mini inter item spacing
 @param size size contain width and height
 @param dataSource dataSource delegate
 @param delegate delegate
 @param className class name
 @return collectionView
 */
+ (UICollectionView *)createCollectionView:(CGRect)frame andBackgroundColor:(UIColor *)bgColor andScrollDirection:(UICollectionViewScrollDirection)scrollDirection andMiniLineSpacing:(NSInteger)lineSpacing andMiniInteritemSpacing:(NSInteger)interitemSpace andItemSize:(CGSize)size andDataSource:(id)dataSource andDelete:(id)delegate andRegisterClass:(NSString *)className;
@end

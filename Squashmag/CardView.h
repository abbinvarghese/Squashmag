//
//  CardView.h
//  YSLDraggingCardContainerDemo
//
//  Created by yamaguchi on 2015/11/09.
//  Copyright © 2015年 h.yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSLCardView.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface CardView : YSLCardView

@property (nonatomic, strong) PFImageView *imageView;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) UIView *selectedView;

@end

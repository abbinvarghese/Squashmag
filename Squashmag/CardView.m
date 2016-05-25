//
//  CardView.m
//  YSLDraggingCardContainerDemo
//
//  Created by yamaguchi on 2015/11/09.
//  Copyright © 2015年 h.yamaguchi. All rights reserved.
//

#import "CardView.h"

@interface CardView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation CardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _imageView = [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor orangeColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.35);
    [self addSubview:_imageView];
    
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:_imageView.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(7.0, 7.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    _imageView.layer.mask = maskLayer;
    
    _selectedView = [[UIView alloc]init];
    _selectedView.frame = _imageView.frame;
    _selectedView.backgroundColor = [UIColor clearColor];
    _selectedView.alpha = 0.0;
    [_imageView addSubview:_selectedView];
    
    _label = [[UILabel alloc]init];
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor clearColor];
    _label.frame = CGRectMake(15,
                              _imageView.frame.size.height + 8,
                              self.frame.size.width - 30,
                              self.frame.size.height * 0.2);
    
    _label.font = [UIFont fontWithName:@"Avenir-Black" size:self.frame.size.height/28];
    [self addSubview:_label];
    
    _label2 = [[UILabel alloc]init];
    _label2.numberOfLines = 0;
    _label2.backgroundColor = [UIColor clearColor];
    _label2.frame = CGRectMake(15,
                               _imageView.frame.size.height + 8 + _label.frame.size.height+8,
                               self.frame.size.width - 30,
                               0);
    _label2.font = [UIFont fontWithName:@"Avenir-Book" size:self.frame.size.height/40];
    [self addSubview:_label2];
}

-(void)setTitle:(NSString *)title{
    _label.text = title;
    _label.frame = CGRectMake(15,
                              _imageView.frame.size.height + 8,
                              self.frame.size.width - 30,
                              self.frame.size.height * 0.2);
    [_label sizeToFit];
}

-(void)setBody:(NSString *)body{
    _label2.text = body;
    _label2.frame = CGRectMake(15,
                               _imageView.frame.size.height + 8 + _label.frame.size.height+8,
                               self.frame.size.width - 30,
                               0);
    [_label2 sizeToFit];
}

-(void)setImage:(UIImage *)image{
    self.imageView.image = image;
}

@end

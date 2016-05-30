//
//  CardView.m
//  YSLDraggingCardContainerDemo
//
//  Created by yamaguchi on 2015/11/09.
//  Copyright © 2015年 h.yamaguchi. All rights reserved.
//

#import "CardView.h"

@interface CardView ()

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

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setup
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNightModeNotification:)
                                                 name:NightModeKey
                                               object:nil];
    
    self.backgroundColor = [SquashHelp colourFor:self];
    
    _imageView = [[PFImageView alloc]init];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width * 3/4);
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
    _label.textColor = [UIColor whiteColor];
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor clearColor];
    _label.frame = CGRectMake(0,
                              0,
                              self.frame.size.width - 30,
                              0);
    
    _label.font = [UIFont fontWithName:@"Avenir-Black" size:self.frame.size.height/25];
    
    [self addSubview:_label];
    
    _label2 = [[UILabel alloc]init];
    _label.tag = 1;
    _label2.textColor = [SquashHelp colourFor:_label];
    _label2.numberOfLines = 0;
    _label2.backgroundColor = [UIColor clearColor];
    _label2.frame = CGRectMake(15,
                               _imageView.frame.size.height+8,
                               self.frame.size.width - 30,
                               0);
    _label2.font = [UIFont fontWithName:@"GillSans" size:self.frame.size.height/35];
    [self addSubview:_label2];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(8.0, self.frame.size.height-44)];
    [path addLineToPoint:CGPointMake(self.frame.size.width-8, self.frame.size.height-44)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeLayer.lineWidth = 0.5;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:shapeLayer];
    
    UIButton *like = [[UIButton alloc]initWithFrame:CGRectMake(20, self.frame.size.height-44, 44, 44)];
    [like setImage:[UIImage imageNamed:@"Heart"] forState:UIControlStateNormal];
    [self addSubview:like];
    
    UIButton *share = [[UIButton alloc]initWithFrame:CGRectMake(72, self.frame.size.height-44, 44, 44)];
    [share setImage:[UIImage imageNamed:@"Share"] forState:UIControlStateNormal];
    [self addSubview:share];
    
    UIButton *refresh = [[UIButton alloc]initWithFrame:CGRectMake(124, self.frame.size.height-44, 44, 44)];
    [refresh setImage:[UIImage imageNamed:@"Refresh"] forState:UIControlStateNormal];
    [self addSubview:refresh];
}

-(void)setTitle:(NSString *)title{
    _label.text = title;
    [_label sizeToFit];
    _label.frame = CGRectMake(15,
                              _imageView.frame.size.height-_label.frame.size.height-8,
                              _label.frame.size.width,
                              _label.frame.size.height);
    
    UIView *gradientLabelView = [[UIView alloc] initWithFrame:CGRectMake(0, _label.frame.origin.y-16, self.frame.size.width, _label.frame.size.height+24)];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = gradientLabelView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor],[[UIColor colorWithWhite:0.0 alpha:0.5] CGColor],[[UIColor colorWithWhite:0.0 alpha:0.7] CGColor],[[UIColor blackColor] CGColor],nil];
    
    [gradientLabelView.layer addSublayer:gradient];
    
    [self insertSubview:gradientLabelView belowSubview:_label];
    
}

-(void)setBody:(NSString *)body{
    _label2.text = body;
    [_label2 sizeToFit];
}

- (void) receiveNightModeNotification:(NSNotification *) notification{
    
    if ([[notification name] isEqualToString:NightModeKey]){
        _label2.textColor = [SquashHelp colourFor:_label];
        self.backgroundColor = [SquashHelp colourFor:self];
    }
}

@end

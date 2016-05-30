//
//  ChannelsCollectionViewCell.m
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "ChannelsCollectionViewCell.h"

@implementation ChannelsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _celImageView.layer.cornerRadius = 5;
    _celImageView.layer.masksToBounds = YES;
    // Initialization code
}

-(void)checkCell:(BOOL)withAnimation{
    double time;
    if (withAnimation) {
        time = 0.1;
    }
    else{
        time = 0.0;
    }
    
    [UIView animateWithDuration:time delay:0  options:UIViewAnimationOptionCurveEaseOut animations:^{
        _checkView.transform = CGAffineTransformMakeScale(1, 1);
        _checkView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)unCheckCell:(BOOL)withAnimation{
    double time;
    if (withAnimation) {
        time = 0.2;
    }
    else{
        time = 0.0;
    }
    
    [UIView animateWithDuration:time delay:0  options:UIViewAnimationOptionCurveEaseOut animations:^{
        _checkView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        _checkView.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}



@end

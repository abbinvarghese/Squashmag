//
//  ChannelsCollectionViewCell.h
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface ChannelsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *celImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellCatagoryName;
@property (weak, nonatomic) IBOutlet UIImageView *checkView;

-(void)checkCell:(BOOL)withAnimation;
-(void)unCheckCell:(BOOL)withAnimation;

@end

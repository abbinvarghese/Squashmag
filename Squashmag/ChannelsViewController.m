//
//  ChannelsViewController.m
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "ChannelsViewController.h"
#import "ChannelsCollectionViewCell.h"
#import <Parse/Parse.h>
#import "Channel.h"

@interface ChannelsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) NSArray *channels;
@property(nonatomic, strong) NSMutableArray *selectedChannels;
@property (weak, nonatomic) IBOutlet UICollectionView *channelsCollectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ChannelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedChannels = [NSMutableArray array];
    [_channelsCollectionView registerNib:[UINib nibWithNibName:@"ChannelsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ChannelsCollectionViewCell"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"channels"];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [_activityIndicator stopAnimating];
            _channels = objects;
            [_channelsCollectionView reloadData];
        } 
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _channels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChannelsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChannelsCollectionViewCell" forIndexPath:indexPath];
    Channel *channel = [_channels objectAtIndex:indexPath.row];
    cell.celImageView.file = channel.channelPic;
    cell.cellCatagoryName.text = channel.channelName;
    if ([_selectedChannels containsObject:_channels[indexPath.row]]) {
        [cell checkCell:YES];
    }
    else{
        [cell unCheckCell:NO];
    }
    [cell.celImageView loadInBackground];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/3-17, [UIScreen mainScreen].bounds.size.width/3);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 15, 8, 15); // top, left, bottom, right
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ChannelsCollectionViewCell *cell = (ChannelsCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if ([_selectedChannels containsObject:_channels[indexPath.row]]) {
        [cell unCheckCell:YES];
        [_selectedChannels removeObject:_channels[indexPath.row]];
    }
    else{
        [cell checkCell:YES];
        [_selectedChannels addObject:_channels[indexPath.row]];
    }
}

@end

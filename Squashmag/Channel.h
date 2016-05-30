//
//  Channel.h
//  Squashmag
//
//  Created by Abbin Varghese on 27/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import <Parse/Parse.h>

@interface Channel : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic,strong) NSString *channelName;
@property (nonatomic,strong) PFFile *channelPic;

@end

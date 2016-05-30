//
//  Channel.m
//  Squashmag
//
//  Created by Abbin Varghese on 27/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "Channel.h"

@implementation Channel

@dynamic channelPic;
@dynamic channelName;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"channels";
}

@end

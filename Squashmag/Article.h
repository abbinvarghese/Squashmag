//
//  Article.h
//  Squashmag
//
//  Created by Abbin Varghese on 27/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import <Parse/Parse.h>

@interface Article : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic,strong) NSString *websiteName;
@property (nonatomic,strong) NSString *articleHeading;
@property (nonatomic,strong) NSString *articleBody;
@property (nonatomic,strong) NSString *articleURL;
@property (nonatomic,strong) PFFile *articlePhoto;

+(void)initDummyData;

@end

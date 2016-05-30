//
//  Article.m
//  Squashmag
//
//  Created by Abbin Varghese on 27/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "Article.h"

@implementation Article

@dynamic articleURL;
@dynamic articleBody;
@dynamic articlePhoto;
@dynamic articleHeading;
@dynamic websiteName;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"articles";
}

+(void)initDummyData{
    Article *article = [Article object];
    article.websiteName = [self randWebsitename];
    article.articleHeading = [self randHead];
    article.articleBody = [self randBody];
    article.articleURL = [self randURL];
    article.articlePhoto = [PFFile fileWithData:UIImageJPEGRepresentation([UIImage imageNamed:[NSString stringWithFormat:@"photo_sample_%@.jpg",[self rand]]], 0.5)];
    [article saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [self initDummyData];
            NSLog(@"succeeded");
        }
        else{
            [self initDummyData];
            NSLog(@"Faild");
        }
    }];
}

+(NSString*)randURL{
    NSInteger randnum = [self randnum:@"1" :@"13"];
    switch (randnum) {
        case 1:
            return @"http://www.cracked.com/blog/5-relationship-zones-worse-than-the-friend-zone/";
            break;
        case 2:
            return @"http://www.uix.com.tr/mobile-ui-ux-design-referanslar-18.html#pazar4arap-ui-ux-design";
            break;
        case 3:
            return @"https://ui8.net/products/next-e-commerce-ui-kit?rel=nl";
            break;
        case 4:
            return @"https://dribbble.com/shots/647272-Circle-Menu-PSD";
            break;
        case 5:
            return @"http://www.pcgamer.com/the-10-coolest-windows-shortcuts-you-never-knew-about/!";
            break;
        case 6:
            return @"https://dribbble.com/shots/1859739-Stock-app/attachments/313080";
            break;
        case 8:
            return @"https://dribbble.com/shots/1676170-Driver-Profile?list=users&offset=2";
            break;
        case 9:
            return @"https://dribbble.com/shots/1878444-Game-Loading-Intro";
            break;
        case 10:
            return @"http://themetapicture.com/geometric-tiger-made-from-triangles/";
            break;
        case 11:
            return @"http://theultralinx.com/2015/07/30-awesome-android-setups/";
            break;
        case 12:
            return @"http://graphicdesignblg.com/post/144954549899/event-list-by-bling-nguyen-follow-us-on-instagram";
            break;
        case 13:
            return @"https://stainlesssteelfabricatorsindelhi.wordpress.com/	";
            break;
        default:
            return @"https://stainlesssteelfabricatorsindelhi.wordpress.com/";
            break;
    }

}

+(NSString*)randBody{
    NSInteger randnum = [self randnum:@"1" :@"4"];
    switch (randnum) {
        case 1:
            return @"The H-1B visa is designed to allow US employers to recruit and employ foreign professionals in speciality occupations within the US while L-1 visas are available to employees of an international company with offices in both the US and abroad. Indian IT firms -- which have to incur an additional burden of about $400 million annually -- have called it 'discriminatory', with Prime Minister Narendra Modi himself raising this at the highest level.The H-1B visa is designed to allow US employers to recruit and employ";
            break;
        case 2:
            return @"US federal Citizenship and Immigration Services ( USCIS ) posted the details of the increased fee on its website today. For H-1B petitioners, one 'must pay the additional $4,000 fee' if the company employs 50 or more employees in the US and more than half of those are in H-1B, L-1A, or L-1B non-immigrant status. burden of about $400 million annually -- have called it 'discriminatory', with Prime Minister Narendra Modi himself raising this at the highest level.The H-1B visa is designed to allow US employers to recruit and employ";
            break;
        case 3:
            return @"The USCIS said the additional fees needs to be a paid in a separate cheque payable to the Department of Homeland Security.The federal agency also laid the parameters for counting the number of employees of the company.The federal agency also laid the parameters for counting the number of employees of the company.burden of about $400 million annually -- have called it 'discriminatory', with Prime Minister Narendra Modi himself raising this at the highest level.The H-1B visa is designed to allow US employers to recruit and employ";
            break;
        default:
            return @"Banerjee believes in living simply. Her ancestral residence at South Kolkata's Harish Chatterjee Street is a terracotta-tiled roof house, which gets flooded during heavy rain. She’s often been seen entering her house during the rain using bricks as stepping stones to cross the waterlogged road. Former Prime Minister Atal Bihari Vajpayee was quite taken burden of about $400 million annually -- have called it 'discriminatory'";
            break;
    }

}

+(NSString*)randWebsitename{
    NSInteger randnum = [self randnum:@"1" :@"20"];
    switch (randnum) {
        case 1:
            return @"Google";
            break;
        case 2:
            return @"YouTube";
            break;
        case 3:
            return @"Facebook";
            break;
        case 4:
            return @"Baidu";
            break;
        case 5:
            return @"Yahoo!";
            break;
        case 6:
            return @"Amazon";
            break;
        case 8:
            return @"Wikipedia";
            break;
        case 9:
            return @"Tencent QQ";
            break;
        case 10:
            return @"Google India";
            break;
        case 11:
            return @"Twitter";
            break;
        case 12:
            return @"Windows Live";
            break;
        case 13:
            return @"Taobao	";
            break;
        case 14:
            return @"MSN";
            break;
        case 15:
            return @"Sina Corp";
            break;
        case 16:
            return @"Yahoo! Japan";
            break;
        case 17:
            return @"Google Japan";
            break;
        case 18:
            return @"LinkedIn";
            break;
        case 19:
            return @"Sina Weibo";
            break;
        case 20:
            return @"Bing";
            break;
            
        default:
            return @"Yandex";
            break;
    }
}

+(NSString*)randHead{
    NSInteger randnum = [self randnum:@"1" :@"20"];
    switch (randnum) {
        case 1:
            return @"Indian IT companies to pay $4,000 more for every";
            break;
        case 2:
            return @"Live: Mamata, ministers take oath of office";
            break;
        case 3:
            return @"15 facts about Mamata that you should know";
            break;
        case 4:
            return @"16-year-old boy 'thrashed', stripped in Delhi";
            break;
        case 5:
            return @"At startups, pay hikes are down to almost nil!";
            break;
        case 6:
            return @"MBAs get more expensive, scholarships ebb";
            break;
        case 8:
            return @"Police 'verify' Rahul Gandhi as a driver in UP";
            break;
        case 9:
            return @"Maruti to recall 75,419 Baleno, 1,961 Dzire cars";
            break;
        case 10:
            return @"La Nina and India's monsoon: 5 key points";
            break;
        case 11:
            return @"IPL: Gujarat face uphill task against Hyderabad";
            break;
        case 12:
            return @"Trump wants $10 million for debate with Sanders";
            break;
        case 13:
            return @"12 Snapchat features you need to know about	";
            break;
        case 14:
            return @"We have proof against Congress netas: Jaitley";
            break;
        case 15:
            return @"Dia Mirza to star in India's first Horror web";
            break;
        case 16:
            return @"SC refuses to stay President's NEET ordinance";
            break;
        case 17:
            return @"10 mistakes men make in bed";
            break;
        case 18:
            return @"6 easy home remedies to get rid of dark circles";
            break;
        case 19:
            return @"Woman allegedly raped at Infosys campus in Pune";
            break;
        case 20:
            return @"Big earthquake coming, warn MHA experts";
            break;
            
        default:
            return @"Farhan Akhtar ends 15-year-old marriage with Adhuna";
            break;
    }

}

+(NSInteger)randnum:(NSString*)min :(NSString*)max{
    
    int randNum = rand() % ([max intValue] - [min intValue]) + [min intValue]; //create the random number.
    
    NSString *num = [NSString stringWithFormat:@"%d", randNum];
    return [num integerValue];
}

+(NSString*)rand{
    NSString *min = @"1"; //Get the current text from your minimum and maximum textfields.
    NSString *max = @"20";
    
    int randNum = rand() % ([max intValue] - [min intValue]) + [min intValue]; //create the random number.
    
    NSString *num = [NSString stringWithFormat:@"%d", randNum];
    return num;
}

@end

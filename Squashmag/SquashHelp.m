//
//  SquashHelp.m
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "SquashHelp.h"

@implementation SquashHelp

+(UIColor*)colourFor:(id)object{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:NightModeKey]) {
        if ([object isKindOfClass:[UILabel class]]) {
            return [UIColor lightTextColor];
        }
        else{
            return [UIColor colorWithWhite:0.2 alpha:1];
        }
    }
    else{
        if ([object isKindOfClass:[UILabel class]]) {
            return [UIColor colorWithWhite:0.3 alpha:1];
        }
        else{
            return [UIColor colorWithWhite:1 alpha:1];
        }
    }

}

+(void)nightMode:(BOOL)mode{
    [[NSUserDefaults standardUserDefaults] setBool:mode forKey:NightModeKey];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:mode] forKey:NightModeKey];
    [[NSNotificationCenter defaultCenter] postNotificationName: NightModeKey object:nil userInfo:userInfo];
}

+(BOOL)isNightMode{
    return [[NSUserDefaults standardUserDefaults] boolForKey:NightModeKey];
}

@end

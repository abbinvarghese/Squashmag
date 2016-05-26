//
//  SquashHelp.h
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NightModeKey @"nightModeKey"

@interface SquashHelp : NSObject

+(UIColor*)colourFor:(id)object;

+(void)nightMode:(BOOL)mode;

+(BOOL)isNightMode;

@end

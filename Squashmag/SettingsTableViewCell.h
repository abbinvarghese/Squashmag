//
//  SettingsTableViewCell.h
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTMaterialSwitch.h"

@interface SettingsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (strong, nonatomic) JTMaterialSwitch *nightSwitch;

@end

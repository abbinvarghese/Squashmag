//
//  SettingsTableViewCell.m
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "SettingsTableViewCell.h"


@implementation SettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _nightSwitch = [[JTMaterialSwitch alloc] init];
    _nightSwitch.hidden = YES;
    _nightSwitch.isOn = [SquashHelp isNightMode];
    _nightSwitch.center = CGPointMake(self.frame.size.width-40, 25);
    [_nightSwitch addTarget:self action:@selector(stateChanged) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_nightSwitch];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)stateChanged{
    [SquashHelp nightMode:_nightSwitch.isOn];
}

@end

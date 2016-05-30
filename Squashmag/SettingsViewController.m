//
//  SettingsViewController.m
//  Squashmag
//
//  Created by Abbin Varghese on 26/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ChannelsViewController.h"

typedef NS_ENUM(NSInteger, AboutIndex) {
    AppStoreRating,
    FeedBack,
    About
};

typedef NS_ENUM(NSInteger, NightModeIndex) {
    NightMode,
};

typedef NS_ENUM(NSInteger, InterestsIndex) {
    Interests,
};

typedef NS_ENUM(NSInteger, SectionIndex) {
    ChannelsSection,
    NightModeSection,
    AboutSection
};

@interface SettingsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *settingsTableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_settingsTableView registerNib:[UINib nibWithNibName:@"SettingsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingsTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == ChannelsSection || section == NightModeSection) {
        return 1;
    }
    else{
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"];
    if (indexPath.section == ChannelsSection) {
        cell.cellTitle.text = @"Channels";
        cell.imageView.image = [UIImage imageNamed:@"Channel"];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    else if (indexPath.section == NightModeSection){
        cell.cellTitle.text = @"Night Mode";
        cell.nightSwitch.hidden = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"NightMode"];
    }
    else{
        if (indexPath.row == AppStoreRating) {
            cell.cellTitle.text = @"Rate us on the AppStore";
            cell.imageView.image = [UIImage imageNamed:@"AppStore"];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
        else if (indexPath.row == FeedBack){
            cell.cellTitle.text = @"Send us a feedback";
            cell.imageView.image = [UIImage imageNamed:@"FeedBack"];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
        else{
            cell.cellTitle.text = @"About us";
            cell.imageView.image = [UIImage imageNamed:@"About"];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == ChannelsSection) {
        ChannelsViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"ChannelsViewController"];
        newView.title = @"Add Channels";
        [self.navigationController pushViewController:newView animated:YES];
        [_settingsTableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (IBAction)dismissViewController:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end

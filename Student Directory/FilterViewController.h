//
//  FilterViewController.h
//  Student Directory
//
//  Created by Joshua Hart on 10/12/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *maleSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *femaleSwitch;
@property (strong, nonatomic) IBOutlet UILabel *genderStatusLabel;
- (IBAction)maleSwitchAction:(id)sender;
- (IBAction)femaleSwitchAction:(id)sender;

@end

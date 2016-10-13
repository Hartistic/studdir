//
//  FilterViewController.m
//  Student Directory
//
//  Created by Joshua Hart on 10/12/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import "FilterViewController.h"
#import "StudentsTableViewController.h"

BOOL Male;
BOOL Female;

@interface FilterViewController ()
@end

@implementation FilterViewController
@synthesize maleSwitch, femaleSwitch;

//-------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------

{
    [super viewDidLoad];
    [self evaluateSwitchStatus];

}

//-------------------------------------------------------------------------------------------------------
-(void) viewDidLayoutSubviews
//-------------------------------------------------------------------------------------------------------

{
    ///NAV TITLE
    self.navigationController.navigationBar.topItem.title = @"Filter Students by:";
    
    ///NAV RIGHT BAR BUTTON "DONE"
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    ///NAV LEFT BAR BUTTON "CANCEL"
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissFilterView)];
    self.navigationItem.leftBarButtonItem = cancelButton;

}

//-------------------------------------------------------------------------------------------------------
-(void)dismissFilterView
//-------------------------------------------------------------------------------------------------------

{
    [self.navigationController popViewControllerAnimated:YES];
}

//-------------------------------------------------------------------------------------------------------
-(void) evaluateSwitchStatus
//-------------------------------------------------------------------------------------------------------

{
    if (femaleSwitch.on && !maleSwitch.on)
    {
        _genderStatusLabel.text = @"Press done to show only female students";
        Male = 0;
        Female = 1;
    }
    else
    {
        _genderStatusLabel.text = @"";
        Male = 0;
        Female = 0;
    }
    if (maleSwitch.on && femaleSwitch.on)
    {
        _genderStatusLabel.text = @"Press done to show all students";
        Male = 1;
        Female = 1;
    }
    if (maleSwitch.on  && !femaleSwitch.on)
    {
        _genderStatusLabel.text = @"Press done to show only male students";
        Male = 1;
        Female = 0;
    }
}

//-------------------------------------------------------------------------------------------------------
-(void) showAlert
//-------------------------------------------------------------------------------------------------------

{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wait.."
                                                                   message:@"You must enable an option to see results!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

//-------------------------------------------------------------------------------------------------------
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//-------------------------------------------------------------------------------------------------------

{
    StudentsTableViewController *STVC = segue.destinationViewController;
    STVC.isMale = Male;
    STVC.isFemale = Female;
}

//-------------------------------------------------------------------------------------------------------
-(IBAction)doneButtonAction:(id)sender
//-------------------------------------------------------------------------------------------------------

{
    if (!maleSwitch.on && !femaleSwitch.on)
    {
        [self showAlert];
    }
    else
    {
        [self performSegueWithIdentifier:@"unwind" sender:self];
    }
}

//-------------------------------------------------------------------------------------------------------
- (IBAction)maleSwitchAction:(id)sender
//-------------------------------------------------------------------------------------------------------

{
    [self evaluateSwitchStatus];
}

//-------------------------------------------------------------------------------------------------------
- (IBAction)femaleSwitchAction:(id)sender
//-------------------------------------------------------------------------------------------------------

{
    [self evaluateSwitchStatus];
}



@end

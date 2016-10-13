//
//  StudentsTableViewController.h
//  Student Directory
//
//  Created by Joshua Hart on 10/11/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "ProgressHUD.h"
#import "StudentCell.h"

@interface StudentsTableViewController : PFQueryTableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) PFObject *post;
@property(nonatomic,strong) NSArray *dataArray;
@property BOOL isMale;
@property BOOL isFemale;


@end

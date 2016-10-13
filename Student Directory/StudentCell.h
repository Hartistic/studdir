//
//  StudentCell.h
//  Student Directory
//
//  Created by Joshua Hart on 10/11/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface StudentCell : PFTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *gender;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *major;
@property (strong, nonatomic) IBOutlet UILabel *undergraduate;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *studentID;

-(void)configureCell:(PFObject *)students;






@end


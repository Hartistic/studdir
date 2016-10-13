//
//  StudentCell.m
//  Student Directory
//
//  Created by Joshua Hart on 10/11/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import "StudentCell.h"

@implementation StudentCell

@synthesize name,age,major,gender,studentID,undergraduate;

//---------------------------------------------------------------------------------------------------------
-(void)configureCell:(PFObject *)students
//---------------------------------------------------------------------------------------------------------

{
    ////Colors Used/////////////////////////////////////////
    UIColor *pink = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(245/255.0) alpha:1];
    UIColor *blue = [UIColor blueColor];
    
    ////Student's Name//////////////////////////////////////
    name.text = [students objectForKey:@"name"];
    if (name.text == NULL)
    {
        name.text = @"Unknown User";
    }
    
    ////Student's Major/////////////////////////////////////
    major.text = [students objectForKey:@"major"];
    if (major.text == NULL || [major.text isEqualToString:@""])
    {
        major.text = @"Unknown Major";
    }
    
    ////Student's ID Number/////////////////////////////////
    studentID.text = [students objectForKey:@"studentID"];
    if (studentID.text == NULL || [studentID.text isEqualToString:@""])
    {
        studentID.text = @"UNKNOWN ID";
    }
    
    ////Student's Age///////////////////////////////////////
    PFObject *ageObject = [students objectForKey:@"age"];
    age.text = [NSString stringWithFormat:@"%@ years old", ageObject];
    if ([age.text isEqualToString: @"(null) years old"] || [ageObject isEqual: @""])
    {
        age.text = @"Unknown Age";
    }
    
    ////Student's Gender////////////////////////////////////
    NSNumber *isMale = [students objectForKey:@"isMale"];
    bool sexBool = [isMale boolValue];
    if (sexBool == YES)
    {
        gender.text = @"Male";
        gender.textColor = blue;
        name.textColor = blue;

    }
    if (sexBool == NO)
    {
        gender.text = @"Female";
        gender.textColor = pink;
        name.textColor = pink;
    }
    
    ////Student's Academic Status////////////////////////////
    undergraduate.text = [students objectForKey:@"undergraduate"];
    if (undergraduate.text == NULL || [undergraduate.text isEqualToString:@""])
    {
        undergraduate.text = @"Unknown";
    }
}

@end



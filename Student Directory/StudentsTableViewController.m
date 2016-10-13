//
//  StudentsTableViewController.m
//  Student Directory
//
//  Created by Joshua Hart on 10/11/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import "StudentsTableViewController.h"
#import <Parse/Parse.h>
#import "FilterViewController.h"



@interface StudentsTableViewController ()

@end

@implementation StudentsTableViewController

@synthesize myTableView;



//-------------------------------------------------------------------------------------------------------
- (id)initWithCoder:(NSCoder *)aCoder
//-------------------------------------------------------------------------------------------------------

{
    self = [super initWithCoder:aCoder];
    if (self)
    {
        self.parseClassName = @"Students";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 10;
    }
    return self;
}

//-------------------------------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
//-------------------------------------------------------------------------------------------------------

{
    [super viewWillAppear:animated];
    [ProgressHUD dismiss];
}

//-------------------------------------------------------------------------------------------------------
- (void)viewDidLayoutSubviews
//-------------------------------------------------------------------------------------------------------

{
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsMake(30,0,0,0);
}

//-------------------------------------------------------------------------------------------------------
- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------

{
    NSString *cellIdentifier = nil;
    
    switch (indexPath.section)
    {
        case 0:
            cellIdentifier = @"currentStudentsCell";
            break;
    }
    
    return cellIdentifier;
}

//-------------------------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------

{
    NSString *cellIdentifier = [self cellIdentifierForIndexPath:indexPath];
    static NSMutableDictionary *heightCache;
    if (!heightCache)
        heightCache = [[NSMutableDictionary alloc] init];
    NSNumber *cachedHeight = heightCache[cellIdentifier];
    if (cachedHeight)
        return cachedHeight.floatValue;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    CGFloat height = cell.bounds.size.height;
    heightCache[cellIdentifier] = @(height);
    return height;
}

//-------------------------------------------------------------------------------------------------------
- (void)refresh:(UIRefreshControl *)refreshControl
//-------------------------------------------------------------------------------------------------------

{
    [refreshControl endRefreshing];
}

//-------------------------------------------------------------------------------------------------------
- (PFQuery *)queryForTable
//-------------------------------------------------------------------------------------------------------

{
    [ProgressHUD show:@"Refreshing"];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Students"];
    if (_isMale == 1 && _isFemale == 1)
    {
        [ProgressHUD dismiss];
        return query;
    }
    if (_isMale == 0 && _isFemale == 1)
    {
        [query whereKey:@"isMale" equalTo:[NSNumber numberWithBool:false]];
        [ProgressHUD dismiss];
        return query;
    }
    if (_isMale == 1 && _isFemale == 0)
    {
        [query whereKey:@"isMale" equalTo:[NSNumber numberWithBool:true]];
        [ProgressHUD dismiss];
        return query;
    }
    if (_isMale == 0 && _isFemale == 0)
    {
        [ProgressHUD dismiss];
        return query;
    }
    else
    {
        [query orderByDescending:@"createdAt"];
        [ProgressHUD dismiss];
        return query;
    }
}

//-------------------------------------------------------------------------------------------------------
- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object: (PFObject *)object
//-------------------------------------------------------------------------------------------------------

{
    static NSString *myTableIdentifier = @"currentStudentsCell";
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:myTableIdentifier];
    if (cell == nil)
    {
        cell = [[StudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myTableIdentifier];
    }
    
    ////CONFIGURE THE CELL////

    ////Student's Image must be given priority to load first////
    PFImageView *studentImageView = [cell viewWithTag:101];
    studentImageView.file = [object objectForKey:@"image"];
    [studentImageView loadInBackground];
    if (studentImageView.file == NULL)
    {
        studentImageView.image = [UIImage imageNamed:@"PlaceholderPhoto"];
    }
    
    ////Now let's do the rest-->declared in StudentCell.h////
    [cell configureCell:object];

    return cell;
}

//-------------------------------------------------------------------------------------------------------
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
//-------------------------------------------------------------------------------------------------------

{
    if ([segue.identifier isEqualToString:@"unwind"])
    {
        [self loadObjects];
    }
}

//-------------------------------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------

{
    if ([self.objects count] == indexPath.row)
    {
        [self loadNextPage];
    }
}

//-------------------------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------

{
    static NSString *CellIdentifier = @"NextPage";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.text = @"Tap to load more...";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

@end


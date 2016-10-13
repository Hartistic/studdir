//
//  HeaderViewStyle.m
//  Base Defense
//
//  Created by Joshua Hart on 10/11/16.
//  Copyright © 2016 Apps By Hart. All rights reserved.
//

#import "HeaderViewStyle.h"

@implementation HeaderViewStyle

//---------------------------------------------------------------------------------------------------------
- (void)awakeFromNib
//---------------------------------------------------------------------------------------------------------

{
    CALayer* layer = [self layer];

    ////Border Radius////
    [layer setCornerRadius:20.0f];
    
    ////Border////
    [layer setBorderColor:[UIColor blackColor].CGColor];
    [layer setBorderWidth:0.6f];
    
    [super awakeFromNib];
}

@end

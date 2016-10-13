//
//  HeaderViewStyle.m
//  Base Defense
//
//  Created by Joshua Hart on 12/3/15.
//  Copyright © 2015 Apps By Hart. All rights reserved.
//

#import "HeaderViewStyle.h"

@implementation HeaderViewStyle


- (void)awakeFromNib {
    
    CALayer* layer = [self layer];

    // border radius
    [layer setCornerRadius:5.0f];
    
    // border
    [layer setBorderColor:[UIColor darkGrayColor].CGColor];
    [layer setBorderWidth:0.2f];
    
    // drop shadow
    [layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [layer setShadowOpacity:0.5];
    [layer setShadowRadius:1.0];
    [layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    [super awakeFromNib];

}

@end

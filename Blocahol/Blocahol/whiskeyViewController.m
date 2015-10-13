//
//  whiskeyViewController.m
//  Blocahol
//
//  Created by Ben Russell on 10/8/15.
//  Copyright © 2015 Ben Russell. All rights reserved.
//

#import "whiskeyViewController.h"

@interface whiskeyViewController ()

@end

@implementation whiskeyViewController

- (NSInteger) ouncesPerGlass
{
    return 1;
}
- (CGFloat) alcoholPercentage
{
    return 0.4;
}

- (NSString *) singularNoun
{
    return NSLocalizedString(@"shot", @"singular shot");
}
- (NSString *) pluralNoun
{
    return NSLocalizedString(@"shots", @"plural of shot");
}

- (NSString *) beverageToCompare
{
    return @"whiskey";
}



@end

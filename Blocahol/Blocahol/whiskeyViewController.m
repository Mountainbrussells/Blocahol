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

- (IBAction)ButtonPressed:(UIButton*)sender
{
    [self.beerPrecentTextField resignFirstResponder];
    
    NSInteger numberOfBeers = self.beerCountSlider.value;
    NSInteger ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPrecentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey = 0.4;
    
    float ouncesOfAlcoholInAWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholInAWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPrecentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    
}

@end

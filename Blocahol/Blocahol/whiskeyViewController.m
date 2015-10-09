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

- (IBAction)sliderValueDidChange:(UISlider*)sender {
    
    NSLog(@"Slider value changed to %f", [sender value]);
    [self.beerPrecentTextField resignFirstResponder];
    
    // first, caculate how much alcohol is in all those beers...
    NSInteger numberOfBeers = sender.value;
    NSLog(@"%f", sender.value);
    NSInteger ouncesInOneBeerGlass = 12; // assume they are 12 oz beeer bottles
    float alcoholPercentageOfBeer = [self.beerPrecentTextField.text floatValue] / 100;
    float ouncesOfAlcoholperBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholperBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey = 0.4;
    
    float ouncesOfAlcoholInAWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholInAWhiskeyGlass;
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    NSString *titleString = [NSString stringWithFormat:NSLocalizedString(@"Whiskey(%.1f %@)", nil), numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    NSLog(@"%@", titleString);
    
    self.navigationItem.title = titleString;
    
    
}

@end

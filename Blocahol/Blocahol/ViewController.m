//
//  ViewController.m
//  Blocahol
//
//  Created by Ben Russell on 10/8/15.
//  Copyright © 2015 Ben Russell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldDidChange:(UITextField*)sender {
    
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
    
}

- (IBAction)sliderValueDidChange:(UISlider*)sender {
    
    NSLog(@"Slider value changed to %f", [sender value]);
    [self.beerPrecentTextField resignFirstResponder];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", (int) sender.value]];
    
    
}
- (IBAction)ButtonPressed:(UIButton*)sender {
    
    [self.beerPrecentTextField resignFirstResponder];
    
    // first, caculate how much alcohol is in all those beers...
    NSInteger numberOfBeers = self.beerCountSlider.value;
    NSInteger ouncesInOneBeerGlass = 12; // assume they are 12 oz beeer bottles
    float alcoholPercentageOfBeer = [self.beerPrecentTextField.text floatValue] / 100;
    float ouncesOfAlcoholperBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholperBeer * numberOfBeers;
    
    // now, calculate the equivilant amount of wine...
    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13; // 13% is average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberofWineGlassForEquivilantAmountOfAlcohol = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    if (numberofWineGlassForEquivilantAmountOfAlcohol == 1){
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine", nil), numberOfBeers, beerText, [self.beerPrecentTextField.text floatValue], numberofWineGlassForEquivilantAmountOfAlcohol, wineText];
    self.resultLabel.text = resultText;
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer*)sender {
    
    [self.beerPrecentTextField resignFirstResponder];
    
}



@end

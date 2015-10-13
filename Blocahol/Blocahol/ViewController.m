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

- (NSInteger) ouncesPerGlass
{
    return 5;
}
- (CGFloat) alcoholPercentage
{
    return 0.13;
}

- (NSString *) singularNoun
{
    return NSLocalizedString(@"glass", @"singular glass");
}
- (NSString *) pluralNoun
{
    return NSLocalizedString(@"glasses", @"plural of glass");
}

- (NSString *) beverageToCompare
{
    return @"wine";
}

- (NSInteger) calculateConversionWithNumberOfBeers:(NSInteger) numberOfBeers andAlcoholByVolume:(CGFloat) percentage {
    
//    NSLog(@"%f", sender.value);
    NSInteger ouncesInOneBeerGlass = 12; // assume they are 12 oz beeer bottles
    float alcoholPercentageOfBeer = percentage / 100;
    float ouncesOfAlcoholperBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholperBeer * numberOfBeers;
    
    // now, calculate the equivilant amount of wine...
    float ouncesInOneWineGlass = [self ouncesPerGlass];
    float alcoholPercentageOfWine = [self alcoholPercentage];
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberofWineGlassForEquivilantAmountOfAlcohol = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSInteger wholeNumber = ceilf(numberofWineGlassForEquivilantAmountOfAlcohol);
    
    return wholeNumber;
}

- (IBAction)sliderValueDidChange:(UISlider*)sender {
    
    NSLog(@"Slider value changed to %f", [sender value]);
    [self.beerPrecentTextField resignFirstResponder];
    
    NSInteger numberOfBeers = (NSInteger)[sender value];
    CGFloat percentage = [self.beerPrecentTextField.text floatValue];
    
    NSInteger wholeNumber = [self calculateConversionWithNumberOfBeers:numberOfBeers andAlcoholByVolume:percentage];
    
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%ld", (long)wholeNumber]];
    
    
}
- (IBAction)ButtonPressed:(UIButton*)sender {
    
    [self.beerPrecentTextField resignFirstResponder];
    
    NSInteger numberOfBeers = (NSInteger)self.beerCountSlider.value;
    CGFloat percentage = [self.beerPrecentTextField.text floatValue];
    NSString *beverageToCompare = [self beverageToCompare];
    
    NSInteger wholeNumber = [self calculateConversionWithNumberOfBeers:numberOfBeers andAlcoholByVolume:percentage];
  
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    if (wholeNumber == 1){
        wineText = [self singularNoun];
    } else {
        wineText = [self pluralNoun];
    }
    
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %ld %@ of %@", nil), numberOfBeers, beerText, [self.beerPrecentTextField.text floatValue], (long)wholeNumber, wineText, beverageToCompare];
    self.resultLabel.text = resultText;
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer*)sender {
    
    [self.beerPrecentTextField resignFirstResponder];
    
}



@end

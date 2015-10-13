//
//  ViewController.h
//  Blocahol
//
//  Created by Ben Russell on 10/8/15.
//  Copyright © 2015 Ben Russell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPrecentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


// Using these methods any child class will automatically update ButtonPressed: and SliderValueDidChange:.  No need to override them.
- (NSInteger) ouncesPerGlass;
- (CGFloat) alcoholPercentage;

- (NSString *) beverageToCompare;
- (NSString *) singularNoun;
- (NSString *) pluralNoun;

- (IBAction)ButtonPressed:(UIButton*)sender;

@end


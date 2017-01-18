//
//  ViewController.h
//  TapChallange
//
//  Created by Agostino Romanelli on 13/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak)IBOutlet UILabel *tapCountLabel;
@property (nonatomic, weak)IBOutlet UILabel *timeLabel;

-(IBAction)buttonPressed:(id)sender;

@end


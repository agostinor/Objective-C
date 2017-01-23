//
//  ViewController.h
//  TapChallange
//
//  Created by Agostino Romanelli on 13/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (nonatomic, weak)IBOutlet UILabel *tapCountLabel;
@property (nonatomic, weak)IBOutlet UILabel *timeLabel;

-(IBAction)buttonPressed:(id)sender;

-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender;



@end


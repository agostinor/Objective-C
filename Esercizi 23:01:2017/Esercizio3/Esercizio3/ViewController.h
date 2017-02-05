//
//  ViewController.h
//  Esercizio3
//
//  Created by Agostino Romanelli on 05/02/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak)IBOutlet UILabel *Domanda;

-(IBAction)ButtonSI:(id)sender;
-(IBAction)ButtonNO:(id)sender;

@end


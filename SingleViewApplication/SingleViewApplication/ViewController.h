//
//  ViewController.h
//  SingleViewApplication
//
//  Created by Agostino Romanelli on 11/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *helloWorldLabel;

@property (nonatomic, weak) IBOutlet
    UITextField *usernameTextField;

-(IBAction)userNameTextFieldDidEndOnExit:(id)sender;
-(IBAction)userNameTextFieldEditingDidEnd:(id)sender;
-(IBAction)buttonPressed:(id)sender;


@end



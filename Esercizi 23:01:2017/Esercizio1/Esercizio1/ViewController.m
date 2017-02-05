//
//  ViewController.m
//  Esercizio1
//
//  Created by Agostino Romanelli on 23/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
}

@end

@implementation ViewController{
    NSString *stringa;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.InseisciNome becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.InseisciNome resignFirstResponder];
}

#pragma mark - Actions

-(IBAction)Plus:(id)sender{
    self.VisualizzaNome.text = self.InseisciNome.text;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Risultati" message:[NSString stringWithFormat:@"gino"]  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAlertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAlertAction];
    [self presentViewController:alertController animated:true completion:nil];
}
@end

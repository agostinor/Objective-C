//
//  ViewController.m
//  Esercizio2
//
//  Created by Agostino Romanelli on 05/02/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSString *stringa;
    NSString *inputString;
    int value;
    int number;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.InserisciNumero resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Actions

-(IBAction)Controlla:(id)sender{

    [self.InserisciNumero resignFirstResponder];
    
    NSString *inputString = self.InserisciNumero.text;
    value = [inputString intValue];
    
    if(value%2==0){
        NSLog(@"Il numero da te inserito è pari");
        self.VisualizzaRisultato.text = @"Il numero da te inserito è pari";
    }else{
        NSLog(@"Il numero da te inserito è dispari");
        self.VisualizzaRisultato.text = @"Il numero da te inserito è dispari";
    }
    
}

@end

//
//  ViewController.m
//  Esercizio3
//
//  Created by Agostino Romanelli on 05/02/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int randomNumber;
    NSString *stringaAlert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [self startProgramm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)startProgramm{
    randomNumber = [self getRandomNumberBetween:(0) to:(100)];
    self.Domanda.text = [NSString stringWithFormat:@"Questo numero è pari?\n\n %i", randomNumber];
    NSLog(@"Numero %i", randomNumber);
}

-(void)ShowLastResults:(NSString *)stringa{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Risultati" message:[NSString stringWithFormat:stringa]  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if([stringa  isEqual: @"Risposta esatta"]){
            [self startProgramm];
        }
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark - Actions

-(IBAction)ButtonNO:(id)sender{
    if(randomNumber%2==0){
        stringaAlert = @"Risposta errata";
    }else{
        stringaAlert = @"Risposta esatta";
    }
    [self ShowLastResults:stringaAlert];
}

-(IBAction)ButtonSI:(id)sender{
    if(randomNumber%2!=0){
        stringaAlert = @"Risposta errata";
    }else{
        stringaAlert = @"Risposta esatta";
    }
    [self ShowLastResults:stringaAlert];
}
@end

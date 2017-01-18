//
//  ViewController.m
//  SingleViewApplication
//
//  Created by Agostino Romanelli on 11/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"


@interface ViewController(){
    int _tapCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tapCount = 0;
    NSString *stringa = @"Romanelli";
    int integer = 678;
    
    //NSLog(@"Questa_è_NSStringa -> %@, %i, %@, %i", @"agostino", integer, stringa, 456);
    NSLog(@"\nMetodo: viewDidLoad\n");
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.helloWorldLabel setText:@"Testo da codice"];
    [self aggiornaTesto:@"Richiamo della funzione e cambio della stringa"];
    
    int mioInt = 5;
    
    NSArray *arrayStatico = @[@"prima stringa", @"seconda stringa"];
    NSLog(@"%@", arrayStatico);
    
    NSMutableArray *arrayMutabile = @[].mutableCopy;
    [arrayMutabile addObject:@"primo utente"];
    NSLog(@"%@", arrayMutabile);
    
    NSArray *arrayStatico2 = [[NSArray alloc]initWithObjects:@"prima stringa", @"seconda stringa", @1, nil];
    
    [self.usernameTextField setText:@"mario"];
    
    
}



-(void)aggiornaTesto:(NSString *)nuovoTesto{
    [self.helloWorldLabel setText:nuovoTesto];
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"\nMetodo: viewDidAppear\n");
    for(int i = 0; i<10; i++){
        NSString *string = [NSString stringWithFormat:@"%i", i];
        NSLog(@"%@", string);
    }
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"\nMetodo: viewWillAppear\n");
}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"\nMetodo: awakeFromNib\n");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)userNameTextFieldDidEndOnExit:(id)sender{
    NSLog(@"\nMetodo: userNameTextFieldDidEndOnExit\n");
}

-(IBAction)userNameTextFieldEditingDidEnd:(UITextField *)sender{
    NSLog(@"\nMetodo: userNameTextFieldEditingDidEnd\n");
}

-(IBAction)buttonPressed:(id)sender{
NSLog(@"\nButton pressed %i\n", _tapCount);
    _tapCount++;
    [self.helloWorldLabel setText:@"gino"];
}


@end

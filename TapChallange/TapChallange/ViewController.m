//
//  ViewController.m
//  TapChallange
//
//  Created by Agostino Romanelli on 13/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"

#define GameTimer 1
#define GameTime 3
#define FirstAppLaunch @"firstAppLaunch"
#define Defaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface ViewController (){
    int _tapsCount;
    int _timeCount;
    
    NSTimer *_gameTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self inizializeGame];
    
}


-(void)viewDidAppear:(BOOL)animated{
    
    if(![self isFirstAppLaunch]){
        [Defaults setBool:true forKey:FirstAppLaunch];
        [Defaults synchronize];
    } else {
        NSArray *results = [self risultati];
        if (results.count > 0)
            [self mostraUltimoRisultato:((NSNumber*) results.lastObject).intValue];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)inizializeGame{
    _tapsCount = 0;
    _timeCount = GameTime;
    
    [self.tapCountLabel setText:@"Tap to play"];
    [self.timeLabel setText:@"Tap Challenge"];
    
}

#pragma mark - Actions

-(IBAction)buttonPressed:(id)sender{
    //loggo in console il valore dei taps effettuati
    NSLog(@"button pressed: %i", _tapsCount);
    
    if(_gameTimer==nil){
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval: GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }

    
    _tapsCount++;
    [self.tapCountLabel setText:[NSString stringWithFormat:@"%i", _tapsCount]];
}

-(void)timerTick{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    _timeCount--;
    
    [self.timeLabel setText:[NSString stringWithFormat:@"%i sec", _timeCount]];

    
    //game over
    if(_timeCount==0){

        [_gameTimer invalidate]; // diciamo al sistema di togliere il timer
        _gameTimer=nil;
        
        
        
        NSString *message = [NSString stringWithFormat:@"Hai fatto %i Taps", _tapsCount];
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"GameOver" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            NSLog(@"OK ACTION PREMUTA");
            // salvo i dati utente
            [self salvaRisultato];
            
            
            //inizializzo tutte le variabili di gioco al loro valore iniziale
            [self inizializeGame];
            
            
        }];
        
        
        
        [alertViewController addAction: okAction];
        [self presentViewController:alertViewController animated:true completion:nil];
        

        
    }
    
}

#pragma mark - UI
-(void)mostraUltimoRisultato:(int)intero{
    //voglio che UIAlterController mi mostri al primo avvio dell'app il precedente risultato del
    // mio utente
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Wall of fame" message:[NSString stringWithFormat:@"Miglior risultato: %i", intero]  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAlertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAlertAction];
    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark - Persistenza

-(bool)isFirstAppLaunch{
    return [[NSUserDefaults standardUserDefaults] boolForKey:FirstAppLaunch];
}

-(NSArray *) risultati {
    NSArray *array = [Defaults objectForKey:Results];
                       
                       if(array == nil){
                           array = @[];
                       }
    NSLog(@"VALORI DAGLI USER DEFAULTS -> %@", array);
    return array;
}


-(void)salvaRisultato {
    NSMutableArray *array = [[Defaults objectForKey: Results] mutableCopy];
    if(array == nil){
        //old way
        //array = [[NSMutableArray alloc] init].mutableCopy;
        
        //new fashion way
        array  = @[].mutableCopy;
    }
    
    //OLD way
    //NSNumber *number = [NSNumber numberWithInt:_tapsCount];
    
    //new fashion way
    [array addObject:@(_tapsCount)];
    
    NSLog(@"mio array -> %@", array);
    
    NSArray *arrayToBeSaved = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        int value1 = obj1.intValue;
        int value2 = obj2.intValue;
        
        if (value1 == value2)
            return NSOrderedSame;
        if (value1 < value2)
            return NSOrderedAscending;
        return NSOrderedDescending;
    }];
    
    [Defaults setObject:arrayToBeSaved forKey:Results];
    [Defaults synchronize];
    /*
    [setInteger:_tapsCount forKey:@"TapsCount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
     */
}





@end

//
//  ViewController.m
//  TapChallange
//
//  Created by Agostino Romanelli on 13/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "GameViewController.h"
#import "ScoreTableViewController.h"


#define GameTimer 1
#define GameTime 3
#define FirstAppLaunch @"firstAppLaunch"
#define Defaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface GameViewController (){
    int _tapsCount;
    int _timeCount;
    
    NSTimer *_gameTimer;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self inizializeGame];
    
    
       //Setto il navigation bar title
 
    self.title = @"TapChallenge";
    
    UIBarButtonItem * scoreButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(scoreButtonPressed)];
    
    //imposto il pulante come elemento alla DX della mia navigatorBar
    self.navigationItem.rightBarButtonItem = scoreButtonItem;
    
}


-(void)viewDidAppear:(BOOL)animated{
    /*
     if(![self isFirstAppLaunch]){
        [Defaults setBool:true forKey:FirstAppLaunch];
        [Defaults synchronize];
    } else {
        NSArray *results = [self risultati];
        if (results.count > 0)
            [self mostraUltimoRisultato:((NSNumber*) results.lastObject).intValue];
    }
     */
    [self resumeGame];
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


#pragma mark - Play / Pause game

-(void)pauseGame {
    if (_gameTimer != nil) {
        [_gameTimer invalidate];
        _gameTimer = nil;
    }
}

-(void)resumeGame {
    if (_timeCount != 0 && _tapsCount > 0) {
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
}


#pragma mark - Actions

-(void)scoreButtonPressed{
    
    /*UIViewController *viewController = [[UIViewController alloc]init];
    viewController.title = @"nuovo";
    viewController.view.backgroundColor = [UIColor redColor];*/
    // pusho all'interno dello stack del mio navigationController un nuovo View controller
    
        ScoreTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreTableViewController"];
    tableViewController.delegate = self;
    
    [self.navigationController pushViewController:tableViewController animated:true];
}

-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender{
    //loggo in console il valore dei taps effettuati
    NSLog(@"button pressed: %i", _tapsCount);
    
    if(_gameTimer==nil){
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval: GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    
    _tapsCount++;
    [self.tapCountLabel setText:[NSString stringWithFormat:@"%i", _tapsCount]];
}

-(IBAction)buttonPressed:(id)sender{

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


#pragma mark - ScoreTableViewDelegate

-(NSArray *)scoreTableViewFetchResults {
    return [self risultati];
}

-(void)scoreTableViewDidFetchResults {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
@end

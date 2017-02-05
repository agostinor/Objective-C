//
//  ViewController.m
//  Esercizio4
//
//  Created by Agostino Romanelli on 05/02/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int randomNumber;
    NSNumber * sum;
}

@end

@implementation ViewController{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self startCode];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)startCode{
    NSMutableArray *array = [NSUserDefaults standardUserDefaults];
    array = @[].mutableCopy;
    
    for(int i = 0; i <100; i++){
        randomNumber = [self getRandomNumberBetween:(0) to:(2000)];
        [array addObject:@(randomNumber)];
    }
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {

        if (obj1 > obj2)
            return NSOrderedAscending;
        else if (obj1 < obj2)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    
    NSLog(@"Elementi dell'array in ordine descresente ->%@", array);
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        
        if (obj1 < obj2)
            return NSOrderedAscending;
        else if (obj1 > obj2)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    
    NSLog(@"Elementi dell'array in ordine crescente ->%@", array);
    
    
    NSNumber * sum = [array valueForKeyPath:@"@sum.self"];
    NSLog(@"La somma dell'array è %@", sum);
    
    [self.VisualizzaSomma setText:[NSString stringWithFormat:@"La somma dell'array è %@", sum]];
}


@end

//
//  ScoreTableViewController.h
//  TapChallange
//
//  Created by Agostino Romanelli on 18/01/17.
//  Copyright © 2017 AgostinoRomanelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScoreTableViewDelegate <NSObject>

/// richiedo i risultati alla classe che conforma al mio protocollo
-(NSArray *)scoreTableViewFetchResults;

/// informo che ho terminato il fetch dei dati
-(void)scoreTableViewDidFetchResults;

@end

@interface ScoreTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *scoresArray;

@property (nonatomic, unsafe_unretained) id <ScoreTableViewDelegate> delegate;

@end

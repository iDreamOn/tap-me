//
//  Database.h
//  tap-me
//
//  Created by Emmanuel Thomas on 10/5/14.
//
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Database : NSObject {
    Player *currentPlayer;
    NSMutableArray *players;
}

@property(nonatomic,retain)Player *currentPlayer;
@property(nonatomic,retain)NSMutableArray *players;

+(Database *)getInstance;

-(void)addPlayer:(Player*) player;
-(void)loadPlayers;

-(void)setCurrentPlayer:(Player*)player;

-(Player *)getPlayerByUsername;
-(Player *)getPlayerByFirstname;

@end

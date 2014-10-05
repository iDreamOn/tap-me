//
//  Database.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/5/14.
//
//

#import "Database.h"
#import "Player.h"

@implementation Database
@synthesize currentPlayer, players;

static Database *instance = nil;

+(Database *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [Database new];
        }
    }
    return instance;
}

-(void)loadPlayers {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Players"
                                                         ofType:@"txt"];
    
        NSError *error;
        NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
        NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    
        for(NSString *obj in listArray){
            NSArray *linevals = [obj componentsSeparatedByString:@","];
            Player *p = [Player new];
            [p setFirstname:[linevals objectAtIndex:0]];
            [p setUsername:[linevals objectAtIndex:1]];
            [p setPassword:[linevals objectAtIndex:2]];
            [players addObject:p];
        }
}

-(void)addPlayer:(Player*) player{
    
    //    NSString *str = [NSString stringWithFormat:@"%@/%@/%@", fname, usrname, upass];
    //
    //    NSString* path = [[NSBundle mainBundle] pathForResource:@"Players"
    //                                                     ofType:@"txt"];
    //
    //    // Open output file in append mode:
    //    NSOutputStream *stream = [[NSOutputStream alloc] initToFileAtPath:path append:YES];
    //    [stream open];
    //    // Make NSData object from string:
    //    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //    // Write data to output file:
    //    [stream write:data.bytes maxLength:data.length];
    //    [stream close];

}

-(void)setCurrentPlayer:(Player*)player {
    if(player!=nil)
    {
        currentPlayer = player;
    }
}

-(Player *)getPlayerByUsername {
    Player *result = nil;
    
    //TODO: add logic to check if user exists
    if(false)
    {
        result = nil;
    }
    
    return result;
}

-(Player *)getPlayerByFirstname {
    Player *result = nil;
    
    //TODO: add logic to check if user exists
    if(false)
    {
        result = nil;
    }
    
    return result;
}

@end

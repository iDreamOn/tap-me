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
            //[instance loadPlayers];
        }
    }
    return instance;
}

-(void)loadPlayers {
        players = [NSMutableArray array];
    
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Players"
                                                         ofType:@"txt"];
    
        NSLog(@"Loading database at %@",path);
    
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
    //Get the path to our plist file
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths firstObject];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Players.plist"];
    NSLog(@"Database is at: %@",plistPath);
    NSLog(@"Adding player: %@",player);
    //Check if file exists
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager fileExistsAtPath:plistPath]) {
        NSLog(@"Loading players from file");
        players = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    else {
        //create empty file
        NSLog(@"Creating a new file");
        NSMutableArray *array = [NSMutableArray array];
        [array writeToFile:plistPath atomically:YES];
    }
    
    [players addObject:player];
    [players writeToFile:plistPath atomically:YES];
}

-(void)setCurrentPlayer:(Player*)player {
    if(player!=nil)
    {
        currentPlayer = player;
    }
}

-(Player *)getPlayerByUsername:(NSString *) value  {
    Player *result = nil;
    
    //TODO: add logic to check if user exists
    if(value!=nil)
    {
        NSLog(@"Looking for username: %@",value);
        result = nil;
    }
    
    return result;
}

-(Player *)getPlayerByFirstname:(NSString *) value {
    Player *result = nil;
    
    //TODO: add logic to check if user exists
    if(false)
    {
        result = nil;
    }
    
    return result;
}

-(void)savePlayers {

}

@end

//
//  Player.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "Player.h"

@implementation Player

static Player *instance = nil;


//- (void)setFirstname:(NSString*) value {
//    firstname = value;
//}

//this is already done with the @property in the header file
//- (NSString*)getFirstname {
//    return firstname;
//}


+(NSMutableArray*)getPlayers {
    
    
    NSMutableArray *players = [NSMutableArray new];
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Players"
                                                     ofType:@"txt"];
    
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    
    NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    
    
    for(NSString *obj in listArray){
        
        
        NSArray *linevals = [obj componentsSeparatedByString:@","];
        
        
        Player *p = [Player new];
        p.firstname = [linevals objectAtIndex:0];
        [p setUsername:[linevals objectAtIndex:1]];
        [p setPassword:[linevals objectAtIndex:2]];
        
        
        [players addObject:p];
        
        
    }
    
    return players;
}



+(void)addPlayer:(NSString*)fname username:(NSString*)usrname pass:(NSString*)upass{
    
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

+(Player *)getInstance {
    
    
    
    if(instance==nil)
    {
        instance= [Player new];
    }
    return instance;
}

+(Player *)setInstance:(Player*)player {
    
    
    
    if(instance==nil)
    {
        instance= [Player new];
        
    }
    
    instance = player;
    
    return instance;
}



- (void)setUsername:(NSString*) value {
    username = value;
}
- (NSString*)getUsername {
    return username;
}

- (void)setPassword:(NSString*) value {
    password = value;
}
- (NSString*)getPassword {
    return password;
}

@end

//
//  Player.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "Player.h"

@implementation Player
@synthesize firstname;

static Player *instance = nil;

+(Player *)getInstance {
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [Player new];
        }
    }
    return instance;
}

- (void)setFirstname:(NSString*) value {
    firstname = value;
}

- (NSString*)getFirstname {
    return firstname;
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

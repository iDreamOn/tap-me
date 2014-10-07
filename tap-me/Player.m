//
//  Player.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "Player.h"

@implementation Player

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

- (NSString *)description {
    return [NSString stringWithFormat: @"%@,%@,%@", firstname,username,password];
}

- (NSMutableDictionary *)getDict {
    NSMutableDictionary *result = [NSMutableDictionary new];
    [result setValue:self.getFirstname forKey:@"firstname"];
    [result setValue:self.getUsername forKey:@"username"];
    [result setValue:self.getPassword forKey:@"password"];
    return result;
}

@end

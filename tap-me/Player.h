//
//  Player.h
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import <Foundation/Foundation.h>

@interface Player : NSObject {
    NSString *firstname;
    NSString *username;
    NSString *password;
}

- (void)setFirstname:(NSString*) value;
- (NSString*)getFirstname;

- (void)setUsername:(NSString*) value;
- (NSString*)getUsername;

- (void)setPassword:(NSString*) value;
- (NSString*)getPassword;

- (NSString *)description;
- (NSMutableDictionary *)getDict;

@end

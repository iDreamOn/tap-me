//
//  ViewUtil.h
//  tap-me
//
//  Created by Emmanuel Thomas on 10/5/14.
//
//

#import <Foundation/Foundation.h>

@interface ViewUtil : NSObject

+(void)textFieldShouldReturn:(UITextField *)textField;
+(void)textFieldDidBeginEditing:(UITextField *)textField window:(UIViewController *) window;
+(void)textFieldDidEndEditing:(UITextField *)textField window:(UIViewController *) window;
+ (void)showInvalidEntriesAlert;

@end

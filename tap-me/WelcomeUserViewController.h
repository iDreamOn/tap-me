//
//  WelcomeUserViewController.h
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import <UIKit/UIKit.h>

@interface WelcomeUserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *welcomeTextField;

- (IBAction)newGameButtonPressed;

- (IBAction)logoutButtonPressed;

@end

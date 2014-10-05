//
//  LoginViewController.h
//  tap-me
//
//  Created by Carlos Pereyra on 10/4/14.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{

IBOutlet UITextField *username;
IBOutlet UITextField *password;
IBOutlet UILabel *failedlogin;
}

-(IBAction)loginPressed;

@end

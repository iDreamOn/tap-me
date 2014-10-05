//
//  LoginViewController.m
//  tap-me
//
//  Created by Carlos Pereyra on 10/4/14.
//
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) loginPressed{
    NSLog(@"login");
    
    
    if ([username.text  isEqual: @"cpereyra"] && [password.text isEqual:@"Maxipereyra15"]){
    
        //[failedlogin setHidden:YES];
        [self performSegueWithIdentifier:@"showWelcomePlayer" sender:self];
    
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid entries!"
                                                        message:[NSString stringWithFormat:@"Please check your entries"]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        //[failedlogin setHidden:NO];
    
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

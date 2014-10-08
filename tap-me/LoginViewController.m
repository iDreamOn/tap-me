//
//  LoginViewController.m
//  tap-me
//
//  Created by Carlos Pereyra on 10/4/14.
//
//

#import "LoginViewController.h"
#import "Player.h"
#import "Database.h"
#import "ViewUtil.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewUtil setBackground:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) loginPressed{
    NSLog(@"login");
    
    Database *db = [Database getInstance];
    Player *p = [db getPlayerByUsername:username.text];
    
    //Player *p = nil;
    
    if (p!=nil) {
        
    } else {
        [ViewUtil showInvalidEntriesAlert];
    }
    
//    for (Player *p in [Player getPlayers]){
//        
//        
//        if ([username.text  isEqual: p.getUsername] && [password.text isEqual:p.getPassword]){
//            
//            
//            
//            [Player setInstance:p];
//            NSLog(@"login successful");
//            [failedlogin setHidden:YES];
//            [self performSegueWithIdentifier:@"welcomesegue" sender:self];
//            break;
//            
//        }else{
//            
//            [failedlogin setHidden:NO];
//            
//        }
    
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)textFieldShouldReturn:(UITextField *)textField
{
    [ViewUtil textFieldShouldReturn:textField];
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    [ViewUtil textFieldDidBeginEditing:textField window:self];
}

- (IBAction)textFieldDidEndEditing:(UITextField *)textField
{
    [ViewUtil textFieldDidEndEditing:textField window:self];
}

@end

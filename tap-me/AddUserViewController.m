//
//  AddUserViewController.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "AddUserViewController.h"
#import "Player.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

- (IBAction)textFieldDidEndEditing:(UITextField *)textField send:(id)sender
{
    [self animateTextField:textField up:NO];
    [sender resignFirstResponder];
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

//creates a new user
-(IBAction)createUserPressed{
   //NSLog(@"Creating:\nfirstname: %@ username: password: ",_firstnameTextField.text);
    if ([self hasValidEntries]) {
        [self setCurrentUser];
        [self performSegueWithIdentifier:@"showWelcomePlayer" sender:self];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid entries!"
                                                        message:[NSString stringWithFormat:@"Please check your entries"]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        NSLog(@"Invalid entries");
    }
    
}

//set current user
-(IBAction)setCurrentUser {
    Player *curr =[Player getInstance];
    [curr setFirstname:_firstnameTextField.text];
    [curr setUsername:_usernameTextField.text];
    [curr setPassword:_passwordTextField.text];
}

-(Boolean) hasValidEntries {
    return !([_firstnameTextField.text length]==0||[_usernameTextField.text length]==0||[_passwordTextField.text length]==0);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  AddUserViewController.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "AddUserViewController.h"
#import "Database.h"
#import "ViewUtil.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController
CGFloat animatedDistance;
//static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
//static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
//static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
//static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
//static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

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
    [self.view setBackgroundColor:[UIColor clearColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    Player *curr = [Player new];
    [curr setFirstname:_firstnameTextField.text];
    [curr setUsername:_usernameTextField.text];
    [curr setPassword:_passwordTextField.text];
    
    Database *db = [Database getInstance];
    
    [db setCurrentPlayer:curr];
    [db addPlayer:curr];
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

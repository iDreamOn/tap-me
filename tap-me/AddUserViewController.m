//
//  AddUserViewController.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "AddUserViewController.h"
#import "Player.h"
#import "ViewUtil.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController
CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

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
//    //[self animateTextField:textField up:YES];
//    //We convert everything to window coordinates, since they're not necessarily in the same coordinate space
//    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
//    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
//    
//    //calculate the fraction between the top and bottom of the middle section for the text field's midline
//    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
//    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
//    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
//    CGFloat heightFraction = numerator / denominator;
//    
//    //Clamp this fraction so that the top section is all "0.0" and the bottom section is all "1.0".
//    if (heightFraction < 0.0)
//    {
//        heightFraction = 0.0;
//    }
//    else if (heightFraction > 1.0)
//    {
//        heightFraction = 1.0;
//    }
//    
//    //Now take this fraction and convert it into an amount to scroll by multiplying by the keyboard height for the current screen orientation. Notice the calls to floor so that we only scroll by whole pixel amounts.
//    UIInterfaceOrientation orientation =
//    [[UIApplication sharedApplication] statusBarOrientation];
//    if (orientation == UIInterfaceOrientationPortrait ||
//        orientation == UIInterfaceOrientationPortraitUpsideDown)
//    {
//        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
//    }
//    else
//    {
//        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
//    }
//    
//    //Finally, apply the animation. Note the use of setAnimationBeginsFromCurrentState: — this will allow a smooth transition to new text field if the user taps on another.
//    CGRect viewFrame = self.view.frame;
//    viewFrame.origin.y -= animatedDistance;
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//    
//    [self.view setFrame:viewFrame];
//    
//    [UIView commitAnimations];
}

- (IBAction)textFieldDidEndEditing:(UITextField *)textField send:(id)sender
{
    [ViewUtil textFieldDidEndEditing:textField window:self];
    //[self animateTextField:textField up:NO];
//    CGRect viewFrame = self.view.frame;
//    viewFrame.origin.y += animatedDistance;
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//    
//    [self.view setFrame:viewFrame];
//    
//    [UIView commitAnimations];
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

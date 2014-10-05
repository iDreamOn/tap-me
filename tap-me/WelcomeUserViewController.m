//
//  WelcomeUserViewController.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import "WelcomeUserViewController.h"
#import "Player.h"

@interface WelcomeUserViewController ()

@end

@implementation WelcomeUserViewController

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
    Player *curr = [Player getInstance];
    _welcomeTextField.text = [NSString stringWithFormat:@"Welcome %@", curr.getFirstname];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)logoutPressed{
    //Set current user to null
    [self performSegueWithIdentifier:@"WelcomeToTap" sender:self];
    
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

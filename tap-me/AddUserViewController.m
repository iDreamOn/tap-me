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
    [ViewUtil setBackground:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [ViewUtil textFieldShouldReturn:textField];
    return YES;
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
        [self performSegueWithIdentifier:@"toWelcomeUser" sender:self];
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

#pragma mark - User Interaction Methods
- (void)imageViewTapped:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:nil
                                 delegate:self
                        cancelButtonTitle:@"Cancel"
                   destructiveButtonTitle:nil
                        otherButtonTitles:@"Take Picture", @"Choose From Library", nil]
                               showInView:self.view];
     }

#pragma mark - Action Sheet Delegate
-(void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    if (buttonIndex == 0 && [UIImagePickerController
                             isSourceTypeAvailable:
                             UIImagePickerControllerSourceTypeCamera]) {
        // Take Picture Selected
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [imagePicker setSourceType:
         UIImagePickerControllerSourceTypeCamera];
        [self.navigationController presentViewController:
         imagePicker animated:YES completion:nil];
    }
    if (buttonIndex == 1) {
        // Choose Photo From Library
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [imagePicker setSourceType:
         UIImagePickerControllerSourceTypePhotoLibrary];
        [self.navigationController presentViewController:
         imagePicker animated:YES completion:nil];
    }
}

#pragma mark - UIImagePicker Delegate
-(void)imagePickerController:(UIImagePickerController *)
picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *pic;
    //Grab the stored image
    if ([info objectForKey:UIImagePickerControllerEditedImage]) {
        pic = [info objectForKey:
               UIImagePickerControllerEditedImage];
        [self.finalImageView setImage:pic];
        [self.placeholderImageView setHidden:YES];
    }
    [self.presentingViewController dismissViewControllerAnimated:
     YES completion:nil];
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

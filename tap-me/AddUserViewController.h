//
//  AddUserViewController.h
//  tap-me
//
//  Created by Emmanuel Thomas on 10/4/14.
//
//

#import <UIKit/UIKit.h>

@interface AddUserViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *placeholderImageView;
@property (strong, nonatomic) IBOutlet UIImageView *finalImageView;
@property (strong, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

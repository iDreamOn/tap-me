//
//  ViewUtil.m
//  tap-me
//
//  Created by Emmanuel Thomas on 10/5/14.
//
//

#import "ViewUtil.h"

@implementation ViewUtil

CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

+ (void)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

+(void)textFieldDidBeginEditing:(UITextField *)textField window:(UIViewController *) window
{
    //[self animateTextField:textField up:YES];
    //We convert everything to window coordinates, since they're not necessarily in the same coordinate space
    CGRect textFieldRect = [window.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [window.view.window convertRect:window.view.bounds fromView:window.view];
    
    //calculate the fraction between the top and bottom of the middle section for the text field's midline
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    //Clamp this fraction so that the top section is all "0.0" and the bottom section is all "1.0".
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    //Now take this fraction and convert it into an amount to scroll by multiplying by the keyboard height for the current screen orientation. Notice the calls to floor so that we only scroll by whole pixel amounts.
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    //Finally, apply the animation. Note the use of setAnimationBeginsFromCurrentState: — this will allow a smooth transition to new text field if the user taps on another.
    CGRect viewFrame = window.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [window.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

+ (IBAction)textFieldDidEndEditing:(UITextField *)textField window:(UIViewController *) window
{
    //[self animateTextField:textField up:NO];
    CGRect viewFrame = window.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [window.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}


@end

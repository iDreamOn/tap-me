//
//  ViewController.h
//  Tap Me
//
//  Created by Emmanuel Thomas on 9/25/14.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    // Add the next three lines
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    // Add these AVAudioPlayer objects!
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}

- (IBAction) buttonPressed;

@end

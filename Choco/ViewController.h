//
//  ViewController.h
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//

#import <UIKit/UIKit.h>
 
@interface ViewController : UIViewController
 
@property (weak, nonatomic) IBOutlet UITextField *txtGuess;
@property (weak, nonatomic) IBOutlet UITextView *tvHistory;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
 
- (IBAction)startGame:(id)sender;
- (IBAction)sendGuess:(id)sender;
- (IBAction)cancelGuessing:(id)sender;
 
@end


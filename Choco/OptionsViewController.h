//
//  OptionsViewController.h
//  Choco
//
//  Created by 박도윤 on 2022/10/07.
//

#import <UIKit/UIKit.h>
 
@interface OptionsViewController : UIViewController
 
@property (weak, nonatomic) IBOutlet UITextField *txtPlayerName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITextView *tvPlayerList;
 
- (IBAction)disconnect:(id)sender;
- (IBAction)searchForPlayers:(id)sender;
- (IBAction)toggleVisibility:(id)sender;
 
@end

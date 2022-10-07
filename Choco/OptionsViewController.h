//
//  OptionsViewController.h
//  Choco
//
//  Created by smac on 2022/10/05.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

//NS_ASSUME_NONNULL_BEGIN

@interface OptionsViewController : UIViewController <MCBrowserViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtPlayerName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITextView *tvPlayerList;

- (IBAction)disconnect:(id)sender;
- (IBAction)searchForPlayers:(id)sender;
- (IBAction)toggleVilsibility:(id)sender;
@end

//NS_ASSUME_NONNULL_END

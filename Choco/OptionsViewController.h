//
//  OptionsViewController.h
//  Choco
//
//  Created by smac on 2022/10/05.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import <MPCHandler.h>

//NS_ASSUME_NONNULL_BEGIN

@interface OptionsViewController : UIViewController <MCBrowserViewControllerDelegate,MCSessionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtPlayerName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITextView *tvPlayerList;
@property (weak, nonatomic) IBOutlet UIImageView *received_img;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)disconnect:(id)sender;
- (IBAction)searchForPlayers:(id)sender;
- (IBAction)toggleVilsibility:(id)sender;
- (IBAction)sendfixedData:(id)sender;
@end

//NS_ASSUME_NONNULL_END

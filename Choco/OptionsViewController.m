//
//  OptionsViewController.m
//  Choco
//
//  Created by smac on 2022/10/05.
//

#import "OptionsViewController.h"
#import "AppDelegate.h"
@interface OptionsViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf:self.swVisible.isOn];
    
    NSLog(@"after clicking options");
}

//-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
//    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES  completion:nil];
//}
//-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
//    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
//}
- (IBAction)searchForPlayers:(id)sender {
    if (self.appDelegate.mpcHandler.session != nil) {
        [[self.appDelegate mpcHandler] setupBrowser];
        
        [[[self.appDelegate mpcHandler] browser] setDelegate:self];

        [self presentViewController:self.appDelegate.mpcHandler.browser
                              animated:YES
                            completion:nil];
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                    message:@"Do you want to connect?"
//                    preferredStyle:UIAlertControllerStyleAlert]; // 1
//            UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"one"
//                    style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//                        NSLog(@"Yes");
//                    }]; // 2
//            UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"two"
//                    style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//                        NSLog(@"No");
//                    }]; // 3
//
//            [alert addAction:firstAction]; // 4
//            [alert addAction:secondAction]; // 5

           // [self presentViewController:alert animated:YES completion:nil];
       NSLog(@"session is not empty");
    }
}

//- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser
//didReceiveInvitationFromPeer:(MCPeerID *)peerID
//                 withContext:(NSData *)context
// invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {
//
//    NSLog(@"peer Id is %@",peerID.displayName);
//    NSLog(@"did receive invitation");
//            BOOL acceptedInvitation = YES;
//
////            MCSession *session = [[MCSession alloc] initWithPeer:peerID];
////            session.delegate = self;
//    invitationHandler(acceptedInvitation, (acceptedInvitation ? self.appDelegate.mpcHandler.session: nil));
//}

//-(void)invitePeer:(MCPeerID *)peerID toSession:(nonnull MCSession *)session withContext:(nullable NSData *)context timeout:(NSTimeInterval)timeout{
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

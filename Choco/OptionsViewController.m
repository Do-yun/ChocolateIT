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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(peerChangedStateWithNotification:)
                                                     name:@"MPCDemo_DidChangeStateNotification"
                                                   object:nil];
    
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
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}
 
- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)peerChangedStateWithNotification:(NSNotification *)notification {
    // Get the state of the peer.
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
 
    // We care only for the Connected and the Not Connected states.
    // The Connecting state will be simply ignored.
    if (state != MCSessionStateConnecting) {
        // We'll just display all the connected peers (players) to the text view.
        NSString *allPlayers = @"Other players connected with:\n\n";
 
        for (int i = 0; i < self.appDelegate.mpcHandler.session.connectedPeers.count; i++) {
            NSString *displayName = [[self.appDelegate.mpcHandler.session.connectedPeers objectAtIndex:i] displayName];
 
            allPlayers = [allPlayers stringByAppendingString:@"\n"];
            allPlayers = [allPlayers stringByAppendingString:displayName];
        }
 
        [self.tvPlayerList setText:allPlayers];
    
    }
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSDictionary *userInfo = @{@"data": data, @"peerID" : peerID
                              };
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidReceiveDataNotification"
        object:nil
        userInfo:userInfo];
    });
    NSString *message =
            [[NSString alloc] initWithData:data
                                  encoding:NSUTF8StringEncoding];
        NSLog(@"%@", message);
    NSLog(@"reach to receive data");
    //NSLog(data);
}





@end

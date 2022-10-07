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
}

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES  completion:nil];
}
-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)searchForPlayers:(id)sender {
    if (self.appDelegate.mpcHandler.session != nil) {
        [[self.appDelegate mpcHandler] setupBrowser];
        [[[self.appDelegate mpcHandler] browser] setDelegate:self];
        
        [self presentViewController:self.appDelegate.mpcHandler.browser
                              animated:YES
                            completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

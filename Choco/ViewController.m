//
//  ViewController.m
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    // Do any additional setup after loading the view.
    
}
- (IBAction)SwipeActionRight:(id)sender {
    NSLog(@"I swipe right");
 
    NSString *message = @"Hello, World!";
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    if ([self.appDelegate.mpcHandler.session sendData:data
                                toPeers: [self.appDelegate.mpcHandler.session connectedPeers]
                               withMode:MCSessionSendDataUnreliable
                                   error:&error]){
        NSLog(@"Data is sent");
    }
}
- (IBAction)SwipeActionLeft:(id)sender {
    NSLog(@"I swipe left");
}
- (IBAction)SwipeActionUp:(id)sender {
    NSLog(@"I swipe up");
}
- (IBAction)SwipeActionDown:(id)sender {
    NSLog(@"I swipe down");
}

@end

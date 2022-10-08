//
//  MPCHandler.m
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//

#import "MPCHandler.h"

@implementation MPCHandler
// create MCPeerID class, pass it displayname
- (void) setupPeerWithDisplayName:(NSString *)displayName {
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
}
// create an MCSession instance by passing the peerID instance variable
// When we open a session, we will need a peer ID
// Flow
// 1st : Do alloc of MCSession
// 2nd : Initwith Peer by using peerID, then provide it to MCSession
- (void)setupSession{
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate = self;
}

- (void)setupBrowser {
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"chocolate-it" session:_session];
}

- (void)advertiseSelf:(BOOL)advertise{
    if(advertise){
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chocolate-it" discoveryInfo:nil session:self.session];
        [self.advertiser start];
    } else{
        [self.advertiser stop];
        self.advertiser = nil;
    }
}
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{
    NSDictionary *userInfo = @{@"peerID" : peerID, @"state" : @(state)};
    dispatch_async(dispatch_get_main_queue(), ^{[[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidChangeStateNotification" object:nil userInfo:userInfo];});
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(nonnull MCPeerID *)peerID {
    NSDictionary *userInfo = @{@"data" : data, @"peerID":peerID};
    dispatch_async(dispatch_get_main_queue(), ^{[[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidReceiveDataNotification" object:nil userInfo:userInfo];});
}

- (void)session:(nonnull MCSession *)session didStartReceivingResourceWithName:(nonnull NSString *)resourceName fromPeer:(nonnull MCPeerID *)peerID withProgress:(nonnull NSProgress *)progress{
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(nonnull NSString *)resourceName fromPeer:(nonnull MCPeerID *)peerID atURL:(nullable NSURL *)localURL withError:(nullable NSError *)error{
    
}
- (void)session:(MCSession *)session didReceiveStream:(nonnull NSInputStream *)stream withName:(nonnull NSString *)streamName fromPeer:(nonnull MCPeerID *)peerID{
    
}

@end

//
//  MPCHandler.m
//  Choco
//
//  Created by smac on 2022/10/05.
//

#import "MPCHandler.h"

@implementation MPCHandler
-(void)setupPeerWithDisplayName: (NSString*)displayName{
    self.peerID = [[MCPeerID alloc] initWithDisplayName: displayName];
}
-(void)setupSession {
    self.session = [[MCSession alloc] initWithPeer: self.peerID];
    self.session.delegate = self;
}
-(void)setupBrowser{
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"my-game" session:_session];
}
-(void)advertiseSelf: (BOOL)advertise{
    if (advertise){
//        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"my-game" discoveryInfo:nil session: self.session];
//        [self.advertiser start];
        self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.peerID discoveryInfo:nil serviceType:@"my-game"];
        [self.advertiser startAdvertisingPeer];
    }
    else {
//        [self.advertiser stop];
//        self.advertiser = nil;
        [self.advertiser stopAdvertisingPeer];
        self.advertiser = nil;
    }
}
//- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser
//didReceiveInvitationFromPeer:(MCPeerID *)peerID
//                 withContext:(NSData *)context
//           invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler {
//
//          //Automatically accept with a new session
////          MCSession *newSession = [[MCSession alloc] initWithPeer:_myPeerID];
////          newSession.delegate = self;
//
//          //Keep track of the pending sessions in a mutable dictionary
//          _pendingSessionPeerIDMap[peerID.displayName] = self.session;
//
//          invitationHandler(YES,self.session);
//
//          /* Code here to present user with option to accept or decline peer */
//}


-(void)invitePeer:(MCPeerID *)peerID toSession:(nonnull MCSession *)session withContext:(nullable NSData *)context timeout:(NSTimeInterval)timeout{
    
}
//keep track of the ppers that connect and disconnect from the game
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    NSDictionary *userInfo = @{ @"peerID" : peerID,
                               @"state" : @(state)};
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidChangeStateNotification"
        object:nil
        userInfo:userInfo];
    });
 
}
 
//device receives data from another peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSDictionary *userInfo = @{@"data": data, @"peerID" : peerID
                              };
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidReceiveDataNotification"
        object:nil
        userInfo:userInfo];
    });
}


- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
 
}

//
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
 
}

//what ChocolateIT should work on!!!????
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
 
}

@end




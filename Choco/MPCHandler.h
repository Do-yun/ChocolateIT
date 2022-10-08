//
//  MPCHandler.h
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>


NS_ASSUME_NONNULL_BEGIN

@interface MPCHandler : NSObject <MCSessionDelegate>

// peerID : an ID for a peer
// session : in charge of multipeer session
// browser : discovering nearby devices, create a multipeer session
@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;


// setupPeerWithDisplayName : accepts an argument(display of public name) that will be used for the device, so it's sort of name
// setupSession : sets up multipeer session
// setupBrowser : sets up MCBrowserViewController instance
// advertiseSelf : tells if this device should be visible or not (Think it is responsible for advertisement)
- (void)setupPeerWithDisplayName:(NSString *)displayName;
- (void)setupSession;
- (void)setupBrowser;
- (void)advertiseSelf:(BOOL)advertise;

- (void)session:(nonnull MCSession *)session peer:(nonnull MCPeerID *)peerID didChangeState:(MCSessionState)state;
- (void)session:(nonnull MCSession *)session didReceiveData:(nonnull NSData *)data fromPeer:(nonnull MCPeerID *)peerID;
- (void)session:(nonnull MCSession *)session didStartReceivingResourceWithName:(nonnull NSString *)resourceName fromPeer:(nonnull MCPeerID *)peerID withProgress:(nonnull NSProgress *)progress;
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(nonnull NSString *)resourceName fromPeer:(nonnull MCPeerID *)peerID atURL:(nullable NSURL *)localURL withError:(nullable NSError *)error;
- (void)session:(MCSession *)session didReceiveStream:(nonnull NSInputStream *)stream withName:(nonnull NSString *)streamName fromPeer:(nonnull MCPeerID *)peerID;

@end


NS_ASSUME_NONNULL_END

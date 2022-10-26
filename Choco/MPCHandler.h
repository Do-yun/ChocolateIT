//
//  MPCHandler.h
//  Choco
//
//  Created by smac on 2022/10/05.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
//NS_ASSUME_NONNULL_BEGIN

@interface MPCHandler : NSObject <MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
//discover nearby devices and to create a multipeer session between them
@property (nonatomic, strong) MCBrowserViewController *browser;
//advertise a device and handle incoming invitations
//@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;
@property (nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;

//display or public name be used for the device
-(void)setupPeerWithDisplayName: (NSString*)displayName;
//in charge of setting up a multipeer session
-(void)setupSession;
//set up the MCBrowserViewController instance
-(void)setupBrowser;
//indicate whether the divice should be visible to other devices
-(void)advertiseSelf: (BOOL)advertise;
//-(void)didReceiveInvitaionFromPeer;
-(void)invitePeer;

@end
//NS_ASSUME_NONNULL_END
//@implementation MPCHandler


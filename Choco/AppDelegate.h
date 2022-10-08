//
//  AppDelegate.h
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//

#import <UIKit/UIKit.h>
#import "MPCHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MPCHandler *mpcHandler;

@end


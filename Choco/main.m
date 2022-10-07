//
//  main.m
//  Choco
//
//  Created by 박도윤 on 2022/09/28.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        NSLog(@"hello");
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

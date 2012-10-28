//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Pascal Linder on 10/07/11.
//  Copyright 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloWorldViewController *viewController;

@end

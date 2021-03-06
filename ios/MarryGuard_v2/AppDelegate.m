/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "CodePush.h"
#import "RCTSplashScreen.h"
#import "RCTRootView.h"
#import <Bugtags/Bugtags.h>
#import <Zhugeio/Zhuge.h>
//#import "RCTPushNotificationManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  /**
   * Loading JavaScript code - uncomment the one you want.
   *
   * OPTION 1
   * Load from development server. Start the server from the repository root:
   *
   * $ npm start
   *
   * To run on device, change `localhost` to the IP address of your computer
   * (you can get this by typing `ifconfig` into the terminal and selecting the
   * `inet` value under `en0:`) and make sure your computer and iOS device are
   * on the same Wi-Fi network.
   */
  [Bugtags startWithAppKey:@"e2a281e3c7c14e4581995c9c796f2aef" invocationEvent:BTGInvocationEventBubble];
  
  Zhuge *zhuge = [Zhuge sharedInstance];
  [zhuge.config setDebug : NO];
  [zhuge.config setChannel:@"App Store"];
  [zhuge startWithAppKey:@"4be92ebc435c4940863b6c1fd737b4e1"
           launchOptions:launchOptions];
  
  jsCodeLocation = [NSURL URLWithString:@"http://192.168.199.152:8081/index.ios.bundle?platform=ios&dev=true"];
  
//  #ifdef DEBUG
//    jsCodeLocation = [NSURL URLWithString:@"http://192.168.199.152:8081/index.ios.bundle?platform=ios&dev=true"];
//  #else
//    jsCodeLocation = [CodePush bundleURL];
//  #endif

  /**
   * OPTION 2
   * Load from pre-bundled file on disk. The static bundle is automatically
   * generated by "Bundle React Native code and images" build step.
   */

  //jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"MarryGuard_v2"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  [RCTSplashScreen show:rootView];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end

//
//  AppDelegate.h
//  RunnersCompass
//
//  Created by Geoff MacDonald on 2012-10-30.
//  Copyright (c) 2012 Geoff MacDonald. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSSlidingViewController.h"
#import "Menu.h"
#import "Logger.h"
#import "UserPrefs.h"
#import "Goal.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, JSSlidingViewControllerDelegate,LoggerViewControllerDelegate, MenuViewControllerDelegate,UIActionSheetDelegate>
{
    UIActionSheet *  sheet;
    UserPrefs * userPrefs;//shared among entire app
    Goal * goal;//shared among app
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JSSlidingViewController *viewController;
@property (strong, nonatomic) LoggerViewController *backVC;
@property (strong, nonatomic) MenuViewController *frontVC;

@end

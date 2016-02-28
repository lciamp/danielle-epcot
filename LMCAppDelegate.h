//
//  LMCAppDelegate.h
//  Countries
//
//  Created by Lou Ciampanelli on 12/5/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMCMainTableViewController.h"

@interface LMCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navagationController;
@property (nonatomic, strong) LMCMainTableViewController *tableViewController;


@end

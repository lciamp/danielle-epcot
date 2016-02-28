//
//  LMCMainTableViewController.h
//  Countries
//
//  Created by Lou Ciampanelli on 12/5/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LMCCountry.h"
#import "LMCCountryDetailsViewController.h"

@interface LMCMainTableViewController : UIViewController <UITableViewDelegate,
    UITableViewDataSource, LMCCountryDetailsViewControllerDelegate, UIAlertViewDelegate>
{
    NSIndexPath *selectIndexPath;
}

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (nonatomic, retain) CLLocationManager * locationManager;

@property (strong, nonatomic) NSArray *countries;







@end

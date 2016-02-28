//
//  LMCCountryDetailsViewController.h
//  Countries
//
//  Created by Lou Ciampanelli on 12/6/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LMCCountry.h"
#import <AudioToolbox/AudioToolbox.h>
#import "MyAnnotation.h"
#import "MyAnnotationView.h"

// Forward declaration need for the protocol to use
// the LMCCountryDetailsViewController type
@class LMCCountryDetailsViewController;

@protocol LMCCountryDetailsViewControllerDelegate <NSObject, MKAnnotation>
- (void)LMCCountryDetailsViewControllerDidFinish:(LMCCountryDetailsViewController *)sender;
@end


@interface LMCCountryDetailsViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    int imageCount;
}

@property(weak, nonatomic) NSTimer *timer;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property(nonatomic, readonly) MKUserLocation *userLocation;

@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *mottoLable;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UILabel *populationLabel;
@property (weak, nonatomic) IBOutlet UILabel *translationLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *donald;

@property (strong, nonatomic) LMCCountry *currentCountry;

@property (strong, nonatomic) id <LMCCountryDetailsViewControllerDelegate> delegate;




@end

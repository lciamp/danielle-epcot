//
//  LMCCountryDetailsViewController.m
//  Countries
//
//  Created by Lou Ciampanelli on 12/6/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import "LMCCountryDetailsViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LMCCountryDetailsViewController ()
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;

@end

@implementation LMCCountryDetailsViewController
@synthesize timer;

// Scale the image for the table view
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

-(void)playMexicanSong
{
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"mexicanHatDanceGood" withExtension:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (void)timerExpired
{
    [self.donald setHidden:YES];
}

-(void)animateDonald
{
    imageCount = imageCount + 1;
    if(imageCount % 2 == 0)
    {
        [self.donald setImage:[UIImage imageNamed:@"donaldReal.png"]];
    }
    else{
        [self.donald setImage:[UIImage imageNamed:@"donaldRealLeft.png"]];
    }

}


//populate the view with the country object that was passed from the table
- (void)populateViewWithCountry:(LMCCountry *)country
{
    //set the countrie
    [super viewDidLoad];
    [self setCurrentCountry: country];
    [self.donald setHidden:YES];
    
    if([country.name isEqualToString:@"Mexico"])
    {
        [self performSelector:@selector(playMexicanSong) withObject:nil afterDelay:0];
        CALayer * flagLayer = [self.donald layer];
        [flagLayer setMasksToBounds: YES];
        [flagLayer setCornerRadius: 8.0];
        [flagLayer setBorderWidth: 1.0];
        [flagLayer setBorderColor: [[UIColor whiteColor] CGColor]];
        [self.donald setImage:[UIImage imageNamed:@"donaldReal.png"]];
        [self.donald setHidden:NO];
        [NSTimer scheduledTimerWithTimeInterval: 7.5
                                         target: self
                                       selector: @selector(timerExpired)
                                       userInfo: nil
                                        repeats: NO];
        imageCount = 0;
        timer = [NSTimer scheduledTimerWithTimeInterval: .2
                                                 target: self
                                               selector: @selector(animateDonald)
                                               userInfo: nil
                                                repeats: YES];  
    }
    
    // round the flag image
    CALayer * flagLayer = [self.flagImageView layer];
    [flagLayer setMasksToBounds: YES];
    [flagLayer setCornerRadius: 8.0];
    // add border
    [flagLayer setBorderWidth: 1.0];
    //Not this one
    [flagLayer setBorderColor: [[UIColor whiteColor] CGColor]];
    [self.flagImageView setImage: country.flag];
    
    // round corners of the mapView
    CALayer * mapLayer = [self.mapView layer];
    [mapLayer setMasksToBounds: YES];
    [mapLayer setCornerRadius: 8.0];
    // add border
    [mapLayer setBorderWidth: 1.0];
    [mapLayer setBorderColor: [[UIColor whiteColor] CGColor]];

    
    // basic set up
    [self.nameLabel setText: country.name];
    [self.capitalLabel setText: country.capital];
    [self.mottoLable setText: country.motto];
    [self.translationLabel setText: country.translation];
    [self.populationLabel setText: country.population];
    [self setLongitude: country.longitude];
    [self setLatitude: country.latitude];
    
    /*
    // create annotation for each country 
    MKPointAnnotation *countryAnnotation = [[MKPointAnnotation alloc] init];
    [countryAnnotation setCoordinate: CLLocationCoordinate2DMake(country.latitude,country.longitude)];
    [countryAnnotation setTitle: country.name];
    //annotation1.subtitle = @"Subtitle";
    // add annotation to the mapView
    [self.mapView addAnnotation:countryAnnotation];
     */
    
    // Custom annotation
    CLLocationCoordinate2D countryLocation = CLLocationCoordinate2DMake(country.latitude,country.longitude);
    MyAnnotation *countryAnnotation = [[MyAnnotation alloc] initWithCoordinate:countryLocation title:country.name subtitle:@""];
    
    // add annotation to map
    [self.mapView addAnnotation: countryAnnotation];

    // set inital region of mapView
    CLLocationCoordinate2D epcotLocation = CLLocationCoordinate2DMake(28.370000, -81.549400);
    MKCoordinateSpan spanOfEpcot = MKCoordinateSpanMake(0.007921, 0.0042500);
    MKCoordinateRegion epcotRegion = MKCoordinateRegionMake(epcotLocation, spanOfEpcot);
    [self.mapView setRegion: epcotRegion
                   animated: NO];
    
    // set map type
    [self.mapView setMapType: MKMapTypeSatellite];
    
    // optional controls for mapView
    [self.mapView setZoomEnabled: YES];
    [self.mapView setScrollEnabled: YES];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self populateViewWithCountry:[self currentCountry]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // basic setup
    [self.mottoLable setAdjustsFontSizeToFitWidth:YES];
    [self.translationLabel setAdjustsFontSizeToFitWidth:YES];
    [self.nameLabel setAdjustsFontSizeToFitWidth:YES];
    [self.mapView setDelegate: self];
    [self.scrollView setScrollEnabled: NO];
    
    // detect orientation change
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(orientationChanged:)
                                                 name: @"UIDeviceOrientationDidChangeNotification"
                                               object: nil];
    
    // center location for epcot
    CLLocationCoordinate2D epcotLocation = CLLocationCoordinate2DMake(28.370000, -81.549400);

    // setup a region for epcot
    CLCircularRegion *epcot = [[CLCircularRegion alloc]initWithCenter: epcotLocation
                                                             radius: 1000
                                                         identifier: @"Epcot"];
    
    
    
    [CLLocationManager regionMonitoringAvailable];
    // start monitoring for our region using best accuracy
    [self.locationManager startMonitoringForRegion: epcot];
       
}

// Turn on / off scrolling for portrait / landscape view
-(void)orientationChanged:(NSNotification *)object
{

    UIDeviceOrientation deviceOrientation = [[object object] orientation];
    
    if(deviceOrientation == UIInterfaceOrientationPortrait || deviceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        //make sure the portrait starts at the top of the view
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
        //turn scrolling off
        [self.scrollView setScrollEnabled: NO];
    }else{
        // enable tapping he top bar to scroll to the top
        [self.scrollView setScrollsToTop: YES];
        // turn scrolling on
        [self.scrollView setScrollEnabled: YES];
        [self.scrollView setShowsHorizontalScrollIndicator: NO];
    }
    
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    // nothing to save
    if(timer)
    {
        [timer invalidate];
        timer = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Location Manager

// send an alert when the user enters a region
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSString *msg = [NSString stringWithFormat:@"Welcome to %@", region.identifier];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @""
                                                    message: msg
                                                   delegate: self
                                          cancelButtonTitle: @"Thanks"
                                          otherButtonTitles: nil];
    [alert show];
}

#pragma mark -
#pragma mark Map View

// resets the region when the map leaves it
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    CLLocationCoordinate2D epcotLocation = CLLocationCoordinate2DMake(28.370000, -81.549400);
    MKCoordinateSpan spanOfEpcot = MKCoordinateSpanMake(0.007921, 0.0042500);
    MKCoordinateRegion epcotRegion = MKCoordinateRegionMake(epcotLocation, spanOfEpcot);
    
    if(self.mapView.region.center.latitude < 28.365593 || self.mapView.region.center.latitude > 28.375351)
    {
        [self.mapView setRegion: epcotRegion animated: YES];
        
    }
    if(self.mapView.region.center.longitude < -81.553491 || self.mapView.region.center.longitude > -81.545466)
    {
        [self.mapView setRegion: epcotRegion animated: YES];
    }
    
}

// Change the annotation pin to the flag

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if([annotation isKindOfClass:[MyAnnotation class]])
        {
            static NSString *userPinAnnotationId = @"userPinAnnotation";
            MyAnnotationView *annotationView = (MyAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:userPinAnnotationId];
            
            if(annotationView)
            {
                annotationView.annotation = annotation;
            }
            else{
                annotationView = [[MyAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:userPinAnnotationId];
                [annotationView.layer setCornerRadius: 8.0];
                [annotationView.layer setBorderWidth: 1.0];
                [annotationView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
                [annotationView setImage: [LMCCountryDetailsViewController scale: [self.currentCountry flag]
                                                                          toSize: CGSizeMake(35,25)]];
                //[annotationView setCanShowCallout:YES];
                //^^^NO CALLOUT WITH ClipsToBounds^^^
                
                [annotationView setClipsToBounds:YES];
                
            }
            return annotationView;
        }
    return nil;
}

@end
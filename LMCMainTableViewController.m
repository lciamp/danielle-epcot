//
//  LMCMainTableViewController.m
//  Countries
//
//  Created by Lou Ciampanelli on 12/5/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import "LMCMainTableViewController.h"
#import "LMCCountry.h"

@interface LMCMainTableViewController ()
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;


@end

@implementation LMCMainTableViewController

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
    // Do any additional setup after loading the view from its nib.
    

    // set the color of the navagation bar
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    // Set the navagation bar text
    [self setTitle: @"Danielle's Epcot"];
    
    // Make this file the delegate and data source for the table view
    [self.countriesTableView setDelegate: self];
    [self.countriesTableView setDataSource: self];
    
    // round the table view's edges
    [self.countriesTableView.layer setCornerRadius: 8.0];
    
    // set a date for danielle's birthday
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:8];
    [comps setMonth:13];
    
    // get current date
    NSDate *date = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit) fromDate:date];
    
    //NSLog(@"birthday: %d, %d  current: %d, %d", comps.day, comps.month, dateComponents.day,  dateComponents.month);
    
    // message if birthday = YES
    if(comps.day == dateComponents.day && comps.month == dateComponents.month)
    {
        NSString *msg = nil;
        msg = @"";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Happy Birthday Danielle!!!"
                                                        message: msg delegate:self
                                              cancelButtonTitle: @"Thanks"
                                              otherButtonTitles: nil];
        [alert show];
    }
    
    // Create the countries
    LMCCountry *usa = [[LMCCountry alloc] init];
    [usa setName: @"America"];
    [usa setMotto: @"E Pluribus Unum"];
    [usa setCapital: @"Washington, D.C."];
    [usa setFlag: [UIImage imageNamed:@"USA.png"]];
    [usa setPopulation: @"311,591,917"];
    [usa setTranslation: @"Out of many, one."];
    [usa setLatitude: 28.367919];
    [usa setLongitude: -81.549395];
    
    LMCCountry *germany = [[LMCCountry alloc] init];
    [germany setName: @"Germany"];
    [germany setMotto: @"Einigkeit und Recht und Freiheit"];
    [germany setCapital: @"Berlin"];
    [germany setFlag: [UIImage imageNamed:@"germany.png"]];
    [germany setPopulation: @"81,726,000"];
    [germany setTranslation: @"Unity and justice and freedom."];
    [germany setLatitude: 28.368372];
    [germany setLongitude: -81.547149];
    
    LMCCountry *italy = [[LMCCountry alloc] init];
    [italy setName: @"Italy"];
    [italy setMotto: @"Repubblica Italian"];
    [italy setCapital: @"Rome"];
    [italy setFlag: [UIImage imageNamed:@"italy.png"]];
    [italy setPopulation: @"60,626,442"];
    [italy setTranslation: @"Italian Republic "];
    [italy setLatitude: 28.368115];
    [italy setLongitude: -81.548216];
    
    LMCCountry *france = [[LMCCountry alloc] init];
    [france setName: @"France"];
    [france setMotto: @"Liberte, Egalite, Fraternite"];
    [france setCapital: @"Paris"];
    [france setFlag: [UIImage imageNamed:@"france.png"]];
    [france setPopulation: @"65,436,552"];
    [france setTranslation: @"Liberty, equality, fraternity."];
    [france setLatitude: 28.369082];
    [france setLongitude: -81.552571];
    
    LMCCountry *england = [[LMCCountry alloc] init];
    [england setName: @"United Kingdom"];
    [england setMotto: @"Dieu et mon droit"];
    [england setCapital: @"London"];
    [england setFlag: [UIImage imageNamed:@"uk.png"]];
    [england setPopulation: @"62,641,000"];
    [england setTranslation: @"God and my right."];
    [england setLatitude: 28.3704];
    [england setLongitude: -81.551829];

    LMCCountry *canada = [[LMCCountry alloc] init];
    [canada setName: @"Canada"];
    [canada setMotto: @"A mari usque ad mare"];
    [canada setCapital: @"Ottawa"];
    [canada setFlag: [UIImage imageNamed:@"canada.png"]];
    [canada setPopulation: @"34,482,779"];
    [canada setTranslation: @"From sea to sea."];
    [canada setLatitude: 28.371393];
    [canada setLongitude: -81.551317];
    
    LMCCountry *japan = [[LMCCountry alloc] init];
    [japan setName: @"Japan"];
    [japan setMotto: @"Hakkō ichiu"];
    [japan setCapital: @"Tokyo"];
    [japan setFlag: [UIImage imageNamed:@"japan.png"]];
    [japan setPopulation: @"127,817,277"];
    [japan setTranslation: @"All the world under one roof."];
    [japan setLatitude: 28.368013];
    [japan setLongitude: -81.550525];
    
    LMCCountry *mexico = [[LMCCountry alloc] init];
    [mexico setName: @"Mexico"];
    [mexico setMotto: @"Patria, Libertad, Trabajo y Cultura"];
    [mexico setCapital: @"Mexico City"];
    [mexico setFlag: [UIImage imageNamed:@"mexico.png"]];
    [mexico setPopulation: @"112,336,538"];
    [mexico setTranslation: @"Fatherland, Freedom, Work and Culture."];
    [mexico setLatitude: 28.371366];
    [mexico setLongitude: -81.547615];
    
    LMCCountry *norway = [[LMCCountry alloc] init];
    [norway setName: @"Norway"];
    [norway setMotto: @"Enige og troe, indtil Dovre falder"];
    [norway setCapital: @"Oslo"];
    [norway setFlag: [UIImage imageNamed:@"norway.png"]];
    [norway setPopulation: @"4,952,000"];
    [norway setTranslation: @"United and loyal until the mountains of Dovre crumble."];
    [norway setLatitude: 28.370518];
    [norway setLongitude: -81.546985];
    
    LMCCountry *china = [[LMCCountry alloc] init];
    [china setName: @"China"];
    [china setMotto: @"没有官方的座右铭"];
    [china setCapital: @"Beijing"];
    [china setFlag: [UIImage imageNamed:@"china.png"]];
    [china setPopulation: @"1,344,130,000"];
    [china setTranslation: @"No official motto"];
    [china setLatitude: 28.369881];
    [china setLongitude: -81.546749];
    
    LMCCountry *morocco = [[LMCCountry alloc] init];
    [morocco setName: @"Morocco"];
    [morocco setMotto: @"لله، الوطن، الملك"];
    [morocco setCapital: @"Rabat"];
    [morocco setFlag: [UIImage imageNamed:@"morocco.png"]];
    [morocco setPopulation: @"32,272,974"];
    [morocco setTranslation: @"God, the Country, the King"];
    [morocco setLatitude: 28.36834];
    [morocco setLongitude: -81.551649];

    // create an array for the countries
    NSArray *myCountries = [NSMutableArray arrayWithObjects: canada, england,
                            france, morocco, japan, usa, italy, germany, china,
                            norway, mexico, nil];
    
    // Sort the array alphabetically
    //NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    //NSArray * descriptors = [NSArray arrayWithObject:valueDescriptor];
    //NSArray * sortedArray = [myCountries sortedArrayUsingDescriptors:descriptors];
    
    // Set the array
    [self setCountries: myCountries];
    
    //circle
    //CLLocationCoordinate2D center = {39.0, -74.00};
    
    // Add an overlay
    //MKCircle *circle = [MKCircle circleWithCenterCoordinate:center radius:150000];
    //[self.mapView addOverlay:circle];
    
}

// Scale the image for the table view
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

// set how many rows in the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.countries count];
}

// Height of the cells in the table view
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)LMCCountryDetailsViewControllerDidFinish:(LMCCountryDetailsViewController *)sender
{
    if(selectIndexPath)
    {
        [self.countriesTableView beginUpdates];
        [self.countriesTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:selectIndexPath]
                                       withRowAnimation:UITableViewRowAnimationNone];
        [self.countriesTableView endUpdates];
    }
    selectIndexPath = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table View

// set up for when you select one of the rows
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    selectIndexPath = indexPath;
    LMCCountry *chosenCountry = [self.countries objectAtIndex: indexPath.row];
    LMCCountryDetailsViewController *detailedViewController = [[LMCCountryDetailsViewController alloc] init];
    [detailedViewController setDelegate: self];
    [detailedViewController setCurrentCountry: chosenCountry];
    
    [self.navigationController pushViewController:detailedViewController animated:YES];

}

// set up each cell for the table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: CellIdentifier];
        [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
        [cell.textLabel setFont: [UIFont systemFontOfSize: 22.0]];
        [cell.detailTextLabel setFont: [UIFont systemFontOfSize: 14]];
    }
    
    LMCCountry *item = [self.countries objectAtIndex:indexPath.row];
    [cell.textLabel setText: [item name]];
    [cell.detailTextLabel setText: [item capital]];
    
    // round the images and add borders
    CALayer * flagLayer = [cell.imageView layer];
    [flagLayer setMasksToBounds: YES];
    [flagLayer setCornerRadius: 8.0];
    [flagLayer setBorderWidth: 1.0];
    [flagLayer setBorderColor: [[UIColor blackColor] CGColor]];
    
    // display the images
    [cell.imageView setImage: [LMCMainTableViewController scale: [item flag]
                                                         toSize: CGSizeMake(80,54)]];
    
    return cell;
}

@end
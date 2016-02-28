//
//  MyAnnotation.h
//  Countries
//
//  Created by Lou Ciampanelli on 12/15/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotation : MKPointAnnotation



-(id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString*)title subtitle:(NSString*)subtitle;

@end

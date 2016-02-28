//
//  MyAnnotation.m
//  Countries
//
//  Created by Lou Ciampanelli on 12/15/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation


-(id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)title subtitle:(NSString *)subtitle;
{
    self = [super init];
    
    if(self)
    {
        self.coordinate = coord;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}

@end

//
//  MyAnnotationView.m
//  Countries
//
//  Created by Lou Ciampanelli on 12/15/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        
        //UIImage *myImage = [UIImage imageNamed:@"uk.png"];
        //self.image = myImage;
        //self.frame = CGRectMake(0,0,40,40);
        //MKCircle *circle = [MKCircle circleWithCenterCoordinate:userLocation.coordinate radius:1000];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.centerOffset = CGPointMake(1,1);
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

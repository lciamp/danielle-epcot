//
//  LMCCountry.h
//  Countries
//
//  Created by Lou Ciampanelli on 12/5/12.
//  Copyright (c) 2012 Lou Ciampanelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LMCCountry : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, assign) NSString *population;
@property (nonatomic, assign) NSString *translation;

@property (nonatomic, strong) UIImage *flag;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;



@end

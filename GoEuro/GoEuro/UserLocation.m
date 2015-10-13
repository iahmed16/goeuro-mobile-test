//
//  UserLocation.m
//  GoEuro
//
//  Created by Islam Ahmed on 10/13/15.
//  Copyright © 2015 iahmed16. All rights reserved.
//

#import "UserLocation.h"
static UserLocation *sharedIns = nil;

@implementation UserLocation{
    CLLocation *location;
    CLLocationManager* locationManager ;
}

#pragma mark Singleton Methods
+ (id)sharedInstance {
    static UserLocation *sharedUserLocation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserLocation = [[self alloc] init];
    });
    return sharedUserLocation;
}

-(void) getUserLocationWithHandler:(LocationManagerCompletionHandler) handler{
    if(location){
        handler(location);
        return;
    }
    locationManager = [[CLLocationManager alloc] init];
    self.completionBlock = handler;
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // accept only CLLocation with valid locationCoordinate
    location = (CLLocationCoordinate2DIsValid(newLocation.coordinate) ? newLocation : nil);
    
    //  Turn off the location manager to preserve energy
    [manager stopUpdatingLocation];
    
    //  Call location changed callback block
    if (self.completionBlock) {
        self.completionBlock(location);
        self.completionBlock = nil;
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_2){
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [manager startUpdatingLocation];
    }
}

@end

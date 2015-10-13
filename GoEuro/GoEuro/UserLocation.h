//
//  UserLocation.h
//  GoEuro
//
//  Created by Islam Ahmed on 10/13/15.
//  Copyright © 2015 iahmed16. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^LocationManagerCompletionHandler)(CLLocation *location);

@interface UserLocation : NSObject
@property (nonatomic, copy) LocationManagerCompletionHandler completionBlock;


+ (id)sharedInstance;
-(void) getUserLocationWithHandler:(LocationManagerCompletionHandler) handler;
@end

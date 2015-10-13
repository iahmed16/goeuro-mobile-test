//
//  CityDataObject.h
//  GoEuro
//
//  Created by Islam Ahmed on 10/13/15.
//  Copyright © 2015 iahmed16. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLPAutoCompletionObject.h"

@interface CityDataObject : NSObject<MLPAutoCompletionObject>
- (instancetype)initWithDict:(NSDictionary*) dict;

@property NSString* name;
@property NSString* country;
@property float longitude;
@property float latitude;
@property double distance;
@end

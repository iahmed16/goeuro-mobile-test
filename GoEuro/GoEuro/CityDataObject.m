//
//  CityDataObject.m
//  GoEuro
//
//  Created by Islam Ahmed on 10/13/15.
//  Copyright © 2015 iahmed16. All rights reserved.
//

#import "CityDataObject.h"

@implementation CityDataObject
- (instancetype)initWithDict:(NSDictionary*) dict
{
    self = [super init];
    if (self) {
        self.name = [dict objectForKey:@"name"];
        self.country = [dict objectForKey:@"country"];
        self.longitude = [[[dict objectForKey:@"geo_position"] objectForKey:@"longitude"] floatValue];
        self.latitude = [[[dict objectForKey:@"geo_position"] objectForKey:@"latitude"] floatValue];
    }
    return self;
}

- (NSString *)autocompleteString{
    return [NSString stringWithFormat:@"%@ ( %@ )",self.name, self.country];
}
@end

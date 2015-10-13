
#import "AutoCompleteDataSource.h"
#import "CityDataObject.h"
#import <AFNetworking/AFNetworking.h>
#import <CoreLocation/CoreLocation.h>
#import "UserLocation.h"
@interface AutoCompleteDataSource (){
}
@end


@implementation AutoCompleteDataSource


#pragma mark - MLPAutoCompleteTextField DataSource


//example of asynchronous fetch:
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)str
            completionHandler:(void (^)(NSArray *))handler
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:[BASE_URL stringByAppendingString:str] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler([self prepareData:responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(NSArray*) prepareData:(id) response{
    NSMutableArray* dataObjects = [[NSMutableArray alloc] init];
    for (NSDictionary* dict in response) {
        [dataObjects addObject:[[CityDataObject alloc] initWithDict:dict]];
    }
    NSArray *sortedArray;
    sortedArray = [dataObjects sortedArrayUsingComparator:^NSComparisonResult(CityDataObject* a, CityDataObject* b) {
        __block CLLocationDistance aDistance = 0;
        __block CLLocationDistance bDistance = 0;
        [[UserLocation sharedInstance] getUserLocationWithHandler:^(CLLocation *curLocation){
            CLLocation *aLoc = [[CLLocation alloc] initWithLatitude:a.latitude longitude:a.longitude];
            CLLocation *bLoc = [[CLLocation alloc] initWithLatitude:b.latitude longitude:b.longitude];
            aDistance = [aLoc distanceFromLocation:curLocation];
            bDistance = [bLoc distanceFromLocation:curLocation];
            a.distance = aDistance;
            b.distance = bDistance;
            
        }];
        
        return [[NSNumber numberWithDouble:aDistance] compare:[NSNumber numberWithDouble:bDistance]];
    }];
    return sortedArray;
}
@end

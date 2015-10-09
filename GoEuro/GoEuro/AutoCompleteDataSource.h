//
//  AutoCompleteDataSource.h
//  GoEuro
//
//  Created by Islam Ahmed on 10/9/15.
//  Copyright © 2015 iahmed16. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLPAutoCompleteTextFieldDataSource.h"
@interface AutoCompleteDataSource : NSObject <MLPAutoCompleteTextFieldDataSource>
//Set this to true to return an array of autocomplete objects to the autocomplete textfield instead of strings.
//The objects returned respond to the MLPAutoCompletionObject protocol.
@property (assign) BOOL testWithAutoCompleteObjectsInsteadOfStrings;


//Set this to true to prevent auto complete terms from returning instantly.
@property (assign) BOOL simulateLatency;

@end

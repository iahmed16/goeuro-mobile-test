//
//  ViewController.h
//  GoEuro
//
//  Created by Islam Ahmed on 10/3/15.
//  Copyright (c) 2015 iahmed16. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLPAutoCompleteTextField.h"
#import "AutoCompleteDataSource.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MLPAutoCompleteTextField *autoCompleteTextField;
@property (strong, nonatomic) IBOutlet AutoCompleteDataSource *autocompleteDataSource;

@end


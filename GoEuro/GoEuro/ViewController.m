//
//  ViewController.m
//  GoEuro
//
//  Created by Islam Ahmed on 10/3/15.
//  Copyright (c) 2015 iahmed16. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.autoCompleteTextField.sortAutoCompleteSuggestionsByClosestMatch = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

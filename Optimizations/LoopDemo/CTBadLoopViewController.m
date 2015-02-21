//
//  CTBadLoopViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTBadLoopViewController.h"

#define kMaxCount 300000

@implementation CTBadLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Counting...";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    for (int i=0; i<3; i++) {
        for (int j=0; j<kMaxCount; j++) {
            NSString *string = @"Hey Charlie! Hey Charlie! Hey Charlie! Hey Charlie! Hey Charlie!";
            // Do something with our string
        }
    }
    
    self.title = @"Done!";
}

@end

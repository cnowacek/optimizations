//
//  CTAutoresizedTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 2/19/15.
//  Copyright (c) 2015 Crowdtilt. All rights reserved.
//

#import "CTAutoresizedTableViewController.h"
#import "CTAutoResizedHeavyTableViewCell.h"

#define kNumberOfRows 1000

static NSString * const CellReuseIdentifier = @"Cell";

@implementation CTAutoresizedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CTAutoResizedHeavyTableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end

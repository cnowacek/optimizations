//
//  CTBadReuseTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTBadReuseTableViewController.h"

#import "CTHeavyTableViewCell.h"

@implementation CTBadReuseTableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[CTHeavyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeavyCell"];
    
    return cell;
}

@end

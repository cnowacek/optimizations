//
//  CTDateTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodDateTableViewController.h"

#import "CTGoodDateTableViewCell.h"

@implementation CTGoodDateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CTGoodDateTableViewCell class] forCellReuseIdentifier:@"DateCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTGoodDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.date = [NSDate date];
    return cell;
}

@end

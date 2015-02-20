//
//  CTDateTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodDateTableViewController.h"

#import "NSDateFormatter+CTHelper.h"

#define kNumberOfRows 1000

static NSString * const CellReuseIdentifier = @"DateCell";

@implementation CTGoodDateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    
    // Formatters should be reused!
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedLongFormatter];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    cell.textLabel.text = dateString;
    
    return cell;
}

@end

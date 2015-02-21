//
//  CTBadDateTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTBadDateTableViewController.h"

#define kNumberOfRows 1000

static NSString * const CellReuseIdentifier = @"DateCell";
static NSString * const DateFormat = @"hh:mm:ss.SSS a";

@implementation CTBadDateTableViewController

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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = DateFormat;
    NSDate *date = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    cell.textLabel.text = dateString;

    return cell;
}

@end

//
//  TableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodReuseTableViewController.h"

#import "CTHeavyTableViewCell.h"

@implementation CTGoodReuseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CTHeavyTableViewCell class] forCellReuseIdentifier:@"HeavyCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeavyCell" forIndexPath:indexPath];
    
    return cell;
}

@end

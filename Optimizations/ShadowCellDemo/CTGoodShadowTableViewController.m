//
//  CTShadowTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodShadowTableViewController.h"

#import "CTGoodShadowTableViewCell.h"


@implementation CTGoodShadowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[CTGoodShadowTableViewCell class] forCellReuseIdentifier:@"ShadowCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShadowCell" forIndexPath:indexPath];
    
    return cell;
}


@end
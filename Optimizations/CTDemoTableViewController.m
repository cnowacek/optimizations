//
//  CTDemoTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTDemoTableViewController.h"

#import "CTGoodReuseTableViewController.h"
#import "CTGoodDateTableViewController.h"
#import "CTGoodShadowTableViewController.h"
#import "CTGoodLoopViewController.h"

#import "CTBadReuseTableViewController.h"
#import "CTBadDateTableViewController.h"
#import "CTBadShadowTableViewController.h"
#import "CTBadLoopViewController.h"

@implementation CTDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Bad";
            break;
        case 1:
            cell.textLabel.text = @"Good";
            break;
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"UITableViewCell Reuse Demo";
        case 1:
            return @"NSDateFormatter Demo";
        case 2:
            return @"UIView Shadow Demo";
        case 3:
            return @"Expensive Loop Demo";
    }
    
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *viewController;
    
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row) {
                viewController = [[CTGoodReuseTableViewController alloc] init];
            } else {
                viewController = [[CTBadReuseTableViewController alloc] init];
            }
        } break;
        case 1: {
            if (indexPath.row) {
                viewController = [[CTGoodDateTableViewController alloc] init];
            } else {
                viewController = [[CTBadDateTableViewController alloc] init];
            }
        } break;
        case 2: {
            if (indexPath.row) {
                viewController = [[CTGoodShadowTableViewController alloc] init];
            } else {
                viewController = [[CTBadShadowTableViewController alloc] init];
            }
        } break;
        case 3: {
            if (indexPath.row) {
                viewController = [[CTGoodLoopViewController alloc] init];
            } else {
                viewController = [[CTBadLoopViewController alloc] init];
            }
        } break;
    }
    
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end

//
//  CTBadReuseTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTBadBlockTableViewController.h"

#import "CTHeavyTableViewCell.h"

#define kNumberOfRows 1000

static NSString * const CellReuseIdentifier = @"HeavyCell";

@interface CTBadBlockTableViewController ()

@property (nonatomic, copy) void (^actionBlock)();

@end

@implementation CTBadBlockTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.actionBlock = ^() {
        self.tableView.hidden = NO;
    };
    
    [self.tableView registerClass:[CTHeavyTableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[CTHeavyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellReuseIdentifier];
    
    return cell;
}

@end

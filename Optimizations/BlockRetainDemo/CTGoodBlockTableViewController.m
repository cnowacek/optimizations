//
//  TableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodBlockTableViewController.h"

#import "CTHeavyTableViewCell.h"

#define kNumberOfRows 1000

static NSString * const CellReuseIdentifier = @"HeavyCell";

@interface CTGoodBlockTableViewController ()

@property (nonatomic, copy) void (^actionBlock)();

@end

@implementation CTGoodBlockTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Capturing self strongly in a block will lead to a retain cycle if the block is owned by 'self'
    __weak typeof(self) wself = self;
    self.actionBlock = ^() {
        wself.tableView.hidden = NO;
    };
    
    [self.tableView registerClass:[CTHeavyTableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end

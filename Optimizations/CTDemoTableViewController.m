//
//  CTDemoTableViewController.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTDemoTableViewController.h"

#import "CTManualTableViewController.h"
#import "CTAutoresizedTableViewController.h"

#import "CTGoodBlockTableViewController.h"
#import "CTGoodDateTableViewController.h"
#import "CTGoodShadowTableViewController.h"
#import "CTGoodLoopViewController.h"

#import "CTBadBlockTableViewController.h"
#import "CTBadDateTableViewController.h"
#import "CTBadShadowTableViewController.h"
#import "CTBadLoopViewController.h"

static NSString * const CellReuseIdentifier = @"Cell";
static NSString * const SectionTitleKey = @"title";
static NSString * const RowsKey = @"rows";
static NSString * const RowTitleKey = @"row_title";
static NSString * const RowViewControllerClassKey = @"row_class";

@interface CTDemoTableViewController ()

@property (nonatomic, copy) NSArray *sections;

@end

@implementation CTDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    
    self.sections = [self tableData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = self.sections[section][RowsKey];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    NSArray *rows = self.sections[indexPath.section][RowsKey];
    NSString *title = rows[indexPath.row][RowTitleKey];
    
    cell.textLabel.text = title;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section][SectionTitleKey];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *rows = self.sections[indexPath.section][RowsKey];
    Class class = rows[indexPath.row][RowViewControllerClassKey];
    
    [self pushViewControllerForClass:class];
}

- (void)pushViewControllerForClass:(Class)class {
    id viewController = [[class alloc] init];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - Table Data

- (NSArray *)tableData {
    return @[@{SectionTitleKey:@"Ownership",
               RowsKey:@[@{RowTitleKey:@"Retain Cycle",
                           RowViewControllerClassKey:[CTBadBlockTableViewController class]},
                         @{RowTitleKey:@"No Retain Cycle",
                           RowViewControllerClassKey:[CTGoodBlockTableViewController class]}]
               },
             @{SectionTitleKey:@"Loop Demo",
               RowsKey:@[@{RowTitleKey:@"Bad Loop Demo",
                           RowViewControllerClassKey:[CTBadLoopViewController class]},
                         @{RowTitleKey:@"Good Loop Demo",
                           RowViewControllerClassKey:[CTGoodLoopViewController class]}]
               },
             @{SectionTitleKey:@"Formatter Reuse",
               RowsKey:@[@{RowTitleKey:@"No reuse",
                           RowViewControllerClassKey:[CTBadDateTableViewController class]},
                         @{RowTitleKey:@"Reuse",
                           RowViewControllerClassKey:[CTGoodDateTableViewController class]}]
               },
             @{SectionTitleKey:@"Shadow Path Rendering",
               RowsKey:@[@{RowTitleKey:@"Lazy shadow path",
                           RowViewControllerClassKey:[CTBadShadowTableViewController class]},
                         @{RowTitleKey:@"Precalculated Shadow Path",
                           RowViewControllerClassKey:[CTGoodShadowTableViewController class]}]
               }];
}

@end

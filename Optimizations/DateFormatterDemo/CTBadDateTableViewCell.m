//
//  CTBadDateTableViewCell.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTBadDateTableViewCell.h"

#import "NSDateFormatter+CTHelper.h"

@implementation CTBadDateTableViewCell

- (void)setDate:(NSDate *)date {
    _date = date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm:ss.SSS a";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    self.textLabel.text = dateString;
}

@end

//
//  CTDateTableViewCell.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodDateTableViewCell.h"

#import "NSDateFormatter+CTHelper.h"

@implementation CTGoodDateTableViewCell

- (void)setDate:(NSDate *)date {
    _date = date;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedLongFormatter];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    self.textLabel.text = dateString;
}

@end

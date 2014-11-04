//
//  NSDateFormatter+CTHelper.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "NSDateFormatter+CTHelper.h"

@implementation NSDateFormatter (CTHelper)

+ (NSDateFormatter *)sharedLongFormatter {
    static NSDateFormatter *longFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        longFormatter = [[self alloc] init];
        longFormatter.dateFormat = @"hh:mm:ss.SSS a";
    });
    return longFormatter;
}

@end

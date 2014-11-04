//
//  CTShadowTableViewCell.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTGoodShadowTableViewCell.h"

@implementation CTGoodShadowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectInset(self.contentView.bounds, 10, 10)];
        shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        shadowView.layer.shadowOpacity = 1.0f;
        shadowView.layer.shadowRadius = 4.0f;
        shadowView.layer.shadowOffset = CGSizeMake(0, 0);
        shadowView.backgroundColor = [UIColor whiteColor];
        shadowView.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowView.bounds].CGPath;
        
        [self.contentView addSubview:shadowView];
    }
    
    return self;
}

@end

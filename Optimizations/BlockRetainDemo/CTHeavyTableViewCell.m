//
//  CTHeavyTableViewCell.m
//  Optimizations
//
//  Created by Charlie Nowacek on 11/3/14.
//  Copyright (c) 2014 Crowdtilt. All rights reserved.
//

#import "CTHeavyTableViewCell.h"

#define kSubviewsCount 50

@implementation CTHeavyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    CGFloat subviewWidth = CGRectGetWidth(self.contentView.bounds) / kSubviewsCount;
    CGFloat subviewHeight = CGRectGetHeight(self.contentView.bounds);
    CGFloat yOrigin = 0;
        for (int i=0; i<kSubviewsCount; i++) {
            
            CGFloat xOrigin = i * subviewWidth;
            CGRect frame = CGRectMake(xOrigin, yOrigin, subviewWidth, subviewHeight);

            UIView *subview = [[UIView alloc] initWithFrame:frame];
            subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            subview.backgroundColor = [self randomColor];
            
            [self.contentView addSubview:subview];
        }
        
    }
    return self;
}

- (UIColor *)randomColor {
    CGFloat randR = arc4random_uniform(256);
    CGFloat randG = arc4random_uniform(256);
    CGFloat randB = arc4random_uniform(256);
    
    return [UIColor colorWithRed:(randR/255.0f) green:(randG/255.0f) blue:(randB/255.0f) alpha:1.0f];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end

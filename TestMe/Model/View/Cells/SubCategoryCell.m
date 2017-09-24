//
//  SubCategoryCell.m
//  TestMe
//
//  Created by Vahan Grigoryan on 5/20/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "SubCategoryCell.h"

@implementation SubCategoryCell

- (void)createCellWithText:(NSString *)subCategory {
    UILabel *categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMidY(self.bounds) - 20, CGRectGetWidth(self.bounds) - 24, 40)];
    [categoryNameLabel setTextAlignment:NSTextAlignmentCenter];
    [categoryNameLabel setText:subCategory];
    [categoryNameLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [categoryNameLabel setTextColor:self.textcolor];
    [self.layer setBorderWidth:1.f];
    [self.layer setBorderColor:self.textcolor.CGColor];
    self.layer.cornerRadius = 4;
    [self addSubview:categoryNameLabel];
}

@end

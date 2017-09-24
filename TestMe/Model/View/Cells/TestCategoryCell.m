//
//  testCategoryCell.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "TestCategoryCell.h"

@implementation TestCategoryCell

- (void)updateCellWithColor:(UIColor *)color andText:(NSString *)categoryName {
    self.categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.bounds) - 50,CGRectGetMidY(self.bounds) - 15, 100, 30)];
    [self.categoryNameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.categoryNameLabel setText:categoryName];
    [self.categoryNameLabel setFont:[UIFont boldSystemFontOfSize:30]];
    [self.categoryNameLabel setTextColor:[UIColor whiteColor]];
    self.backgroundColor = color;
    [self addSubview:self.categoryNameLabel];
}

@end

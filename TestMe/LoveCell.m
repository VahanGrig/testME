//
//  LoveCell.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "LoveCell.h"

@implementation LoveCell

- (void)updateCellWithColor:(UIColor *)color andText:(NSString *)categoryName {
    self.categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.bounds) - 100, CGRectGetMidY(self.bounds) - 25, 200, 40)];
    [self.categoryNameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.categoryNameLabel setText:categoryName];
    [self.categoryNameLabel setFont:[UIFont italicSystemFontOfSize:30]];
    [self.categoryNameLabel setTextColor:[UIColor whiteColor]];
    UIImageView *categoriImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMidY(self.bounds), 40, 40)];
    categoriImage.center = CGPointMake(self.categoryNameLabel.center.x, self.categoryNameLabel.center.y + 30);
    categoriImage.image = [UIImage imageNamed:@"love_heart"];
    self.backgroundColor = color;
    [self addSubview:categoriImage];
    [self addSubview:self.categoryNameLabel];
}

@end

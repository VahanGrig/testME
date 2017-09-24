//
//  LoveCell.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoveCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *categoryNameLabel;

- (void)updateCellWithColor:(UIColor *)color andText:(NSString *)categoryName;

@end

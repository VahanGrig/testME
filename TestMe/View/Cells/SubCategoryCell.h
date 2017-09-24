//
//  SubCategoryCell.h
//  TestMe
//
//  Created by Vahan Grigoryan on 5/20/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCategoryCell : UICollectionViewCell

@property (nonatomic, strong) UIColor *textcolor;

- (void)createCellWithText:(NSString *)subCategory;

@end

//
//  ChoiceTableViewCell.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "ChoiceTableViewCell.h"

@implementation ChoiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 6;
    frame.size.width -= 12;
    [super setFrame:frame];
}

@end

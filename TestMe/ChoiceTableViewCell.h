//
//  ChoiceTableViewCell.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *choiceNumber;

@end

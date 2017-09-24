//
//  CategoryInputViewController.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *categoryPickerView;
@property (weak, nonatomic) IBOutlet UITextField *testHeaderField;

- (IBAction)nextAction:(UIButton *)sender;

@end

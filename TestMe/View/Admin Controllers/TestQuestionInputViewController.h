//
//  TestQuestionInputViewController.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMTestPackage.h"

@interface TestQuestionInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UITableView *choicesTableView;
@property (nonatomic, strong) RLMTestPackage *testPackage;

- (IBAction)nextQuestionAction:(UIButton *)sender;
- (IBAction)saveAction:(UIButton *)sender;

@end

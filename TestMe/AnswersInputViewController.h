//
//  AnswersInputViewController.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMTestPackage.h"

@interface AnswersInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *testHeaderName;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;
@property (weak, nonatomic) IBOutlet UITextField *answerIDField;
@property (weak, nonatomic) IBOutlet UITextField *poinOfanswerField;
@property (nonatomic, strong) RLMTestPackage *testPackage;

- (IBAction)doneAction:(UIButton *)sender;
- (IBAction)nextAction:(UIButton *)sender;

@end

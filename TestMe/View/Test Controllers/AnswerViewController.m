//
//  AnswerViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 5/21/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "AnswerViewController.h"
#import "UIColor+Utility.h"

@interface AnswerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nextTestButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.questionLabel.layer setBorderWidth:1];
    [self.questionLabel.layer setCornerRadius:4];
    [self.questionLabel.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.questionLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.answerTextView.layer setBorderWidth:1];
    [self.answerTextView.layer setCornerRadius:4];
    [self.answerTextView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.answerTextView.layer setBackgroundColor:[UIColor colorFromHexString:@"#EFEFEF"].CGColor];
    [self.answerTextView setTextAlignment:NSTextAlignmentCenter];
    [self.answerTextView setUserInteractionEnabled:YES];
    
    [self.questionLabel setText:self.questionText];
    [self.answerTextView setText:self.anwerText];
   
    [self.nextTestButton.layer setCornerRadius:4];
    [self.nextTestButton setBackgroundColor:[UIColor colorFromHexString:@"#2F4E48"]];

    self.view.backgroundColor = [UIColor colorFromHexString:@"#EFEFEF"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
}

@end

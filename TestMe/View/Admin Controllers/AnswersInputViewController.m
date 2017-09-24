//
//  AnswersInputViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "AnswersInputViewController.h"
#import "Question.h"
#import "Answer.h"

@interface AnswersInputViewController ()

@property (nonatomic, strong) RLMArray <Question> *questions;
@property (nonatomic, strong) Question *questionObject;
@property (nonatomic, strong) NSMutableArray *answerArray;

@end

@implementation AnswersInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.answerArray = [NSMutableArray new];
    self.questionObject = [Question new];
    
    self.answerTextView.layer.borderWidth = 1.0f;
    self.answerTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.answerTextView.layer.cornerRadius = 4.0f;
    
    //self.testPackageArray = [[RLMTestPackage allObjects] sortedResultsUsingKeyPath:@"categoryName" ascending:YES];
}

- (IBAction)doneAction:(UIButton *)sender {
    [self writeAnswersToRealm];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [RLMTestPackage createInRealm:realm withValue:self.testPackage];
    [realm commitWriteTransaction];
}

- (IBAction)nextAction:(UIButton *)sender {
    [self writeAnswersToRealm];
    self.answerTextView.text = @"";
    self.answerIDField.text = @"";
}

- (void)writeAnswersToRealm {
    if (![self.answerTextView.text isEqualToString:@""]||![self.answerIDField.text isEqualToString:@""]) {
        Answer *answerObject = [Answer new];
        answerObject.answareText = self.answerTextView.text;
        answerObject.answareID = self.answerIDField.text;
        answerObject.points = self.poinOfanswerField.text;
        [self.testPackage.answers addObject:answerObject];
    }
}

@end

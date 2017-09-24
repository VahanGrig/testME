//
//  TestFillingViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 5/11/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "TestFillingViewController.h"
#import "UIColor+Utility.h"
#import "Question.h"
#import "Choice.h"
#import "Answer.h"
#import "AnswerViewController.h"
#import "ChoiceTableViewCell.h"
#import "TestCalculation.h"

@interface TestFillingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) RLMArray <Choice *> *choicesArray;
@property (nonatomic, strong) RLMArray <Answer *> *answers;
@property (nonatomic, strong) NSMutableArray *questionsArray;
@property (nonatomic, assign) int questionNumber;
@property (nonatomic, copy) NSString *answareId;

@end

@implementation TestFillingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionNumber = 0;
    self.answareId = @"";
    self.navigationItem.title = self.controllerTitle;
    self.questionsArray = [NSMutableArray array];
    for (RLMTestPackage *testPackage in self.categoryArray) {
        if ([testPackage.categoryName isEqualToString:self.controllerTitle] &&[testPackage.subCategoryName isEqualToString:self.subCategoryString]) {
            self.answers = testPackage.answers;
            for (Question *question in testPackage.questions) {
                [self.questionsArray addObject:question];
            }
        }
    }
    self.choicesArray = [[self.questionsArray objectAtIndex:
                          self.questionNumber] choices];
    self.questionText.text = [[self.questionsArray objectAtIndex:
                               self.questionNumber] questionText];
    //self.questionText.textColor = [UIColor lightGrayColor];
    self.questionText.backgroundColor = [UIColor whiteColor];
    self.questionText.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.questionText.layer.borderWidth = 1.f;
//    self.questionText.layer.cornerRadius = 4.f;

    UIColor *backgroundColor = [UIColor colorFromHexString:@"#2F4E48"];
    self.fillTableView.backgroundColor = backgroundColor;
    self.view.backgroundColor = backgroundColor;
    self.fillTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.choicesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.questionLabel.text = [[self.choicesArray objectAtIndex:indexPath.row] choiceText];
    cell.choiceNumber.text = [NSString stringWithFormat:@"%ld", (indexPath.row + 1)];
    return cell;
}

#pragma mark -UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.questionsArray count] - 1 > self.questionNumber) {
    ++self.questionNumber;
    self.answareId = [self.answareId stringByAppendingString:[NSString stringWithFormat:@"%ld", (indexPath.row + 1)]];
    self.choicesArray = [[self.questionsArray objectAtIndex:
                          self.questionNumber] choices];
    self.questionText.text = [[self.questionsArray objectAtIndex:
                               self.questionNumber] questionText];
    [self.fillTableView reloadData];
    } else {
        self.answareId = [self.answareId stringByAppendingString:[NSString stringWithFormat:@"%ld", (indexPath.row + 1)]];
        NSString *answerText = @"";
       
        //checking if there is corresponding answer to answerId
        for (Answer *answer in self.answers) {
            if ([answer.answareID isEqualToString:self.answareId]) {
                answerText = answer.answareText;
            }
        }
        
        //checking if there is corresponding answer to sum of answerid
        if ([answerText isEqualToString:@""]) {
            NSInteger testPoint = [TestCalculation testPointFromAnswerId:self.answareId andTestName:self.subCategoryString];
            for (Answer *answer in self.answers){
                NSArray *points = [answer.points componentsSeparatedByString:@"-"];
                NSInteger minPoint = ((NSString *)points[0]).integerValue;
                NSInteger maxPoint = ((NSString *)points[1]).integerValue;
                if (testPoint <= maxPoint && testPoint >= minPoint ) {
                    answerText = answer.answareText;
                }
            }
        }
        
        //individual case for avarege age detection
        if ([self.subCategoryString isEqualToString:@"How long will you live?"]) {
            NSInteger testPoint = [TestCalculation testPointFromAnswerId:self.answareId andTestName:self.subCategoryString];
            answerText = [NSString stringWithFormat:@"You will live about %ld years.\n But, of course, you will exceed it if you better watch yourself and refuse bad habits.", (long)testPoint];
        }
        
        //individual case for creative age detection
        if ([self.subCategoryString isEqualToString:@"What is your creative age?"]) {
            NSInteger testPoint = [TestCalculation testPointFromAnswerId:self.answareId andTestName:self.subCategoryString];
            answerText = [NSString stringWithFormat:@"Your creative age is %ld years.\n If your creative age coincides with your age, then everything is in order. For those who prefer creative activity, it is desirable that the psychological age is not faster than the passport age. And if after thirty years it falls behind, it will mean that you are in good shape, free from stereotypes and your possibilities are far from exhausted. \n When your creative age is a little bit ahead of you - also not bad: it means that you will successfully cope with standard actions that require clarity and punctuality", (long)testPoint];
        }
        
        //individual case for temper detection
        if ([self.subCategoryString isEqualToString:@"Your temper."]) {
            NSArray *testPoinArray = [TestCalculation testPointComponentsFromAnswerId:self.answareId andTestName:self.subCategoryString];
            answerText = [NSString stringWithFormat:@"You are %@ precent choleric, %@ precent sanguine, %@ precent phlegmatic, %@ precent melancholic.\n\n CHOLERIC — The Choleric temperament is fundamentally ambitious and leader-like. The Choleric is the strongest of the extroverted Temperaments, and is sometimes referred to as a “Type A” personality or “the doer”.\n\n SANGUINE — The Sanguine temperament is fundamentally impulsive and pleasure-seeking. Sanguine’s are frequently referred to as “the talker”. \n\n PHLEGMATIC — The Phlegmatic temperament is fundamentally relaxed and quiet, ranging from warmly attentive to lazily sluggish. Phlegmatics are referred to as “the watcher”. \n\n MELANCHOLIC — The Melancholic temperament is fundamentally introverted & thoughtful. Melancholies are often referred to as “the thinker.” ", testPoinArray[0],testPoinArray[1],testPoinArray[2], testPoinArray[3]];
        }
        [self performSegueWithIdentifier:@"answer" sender:answerText];
    }
}

#pragma mark -segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"answer"]) {
        AnswerViewController *vc = [segue destinationViewController];
        vc.anwerText = sender;
        vc.questionText = self.controllerTitle;
    }
}

@end

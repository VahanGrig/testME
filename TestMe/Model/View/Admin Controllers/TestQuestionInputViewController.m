//
//  TestQuestionInputViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "TestQuestionInputViewController.h"
#import "AnswersInputViewController.h"
#import "TestFillTableViewCell.h"
#import "Question.h"
#import "Choice.h"

@interface TestQuestionInputViewController () <UITableViewDelegate,UITableViewDataSource, UITextViewDelegate>

@property (nonatomic, strong) NSMutableArray *choiceStringArray;
@property (nonatomic, assign) NSInteger choiceTextLinesCount;
@property (nonatomic, assign) NSInteger nextCellNumber;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) BOOL isNextPressed;
@property (nonatomic, strong) Question *questionObject;

@end

@implementation TestQuestionInputViewController

static NSString *cellIdentifier = @"cellId";
static NSString *emptyCellString = @"Unsaved cell";
static const CGFloat cellHeight = 30;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.choiceStringArray = @[emptyCellString].mutableCopy;
    self.choiceTextLinesCount = 1;
    self.cellHeight = cellHeight;
    [self.choicesTableView reloadData];
}

- (void)viewWillLayoutSubviews {
    self.choicesTableView.contentSize = CGSizeMake(self.choicesTableView.bounds.size.width, 700);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.choiceStringArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestFillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.questionView.delegate = self;
    cell.questionView.text = self.choiceStringArray[indexPath.row];
    if (indexPath.row == self.nextCellNumber) {
        [cell.questionView becomeFirstResponder];
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"%li",indexPath.row + 1];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.cellHeight;//15 + [self heightOfText:self.choiceStringArray[indexPath.row]];
}

#pragma mark -textViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSInteger cellRowNumber = [self cellRowNumberOfTextView:textView];
    if([text isEqualToString:@"\n"]) {
        if ([self.choiceStringArray count] - 1 == cellRowNumber) {
            [self.choiceStringArray addObject:emptyCellString];
            [self.choicesTableView reloadData];
        }
        self.nextCellNumber = cellRowNumber + 1;
        [textView resignFirstResponder];
        [self.choicesTableView reloadData];
        return NO;
    }
    NSInteger rowsCount = ((textView.contentSize.height - textView.textContainerInset.top - textView.textContainerInset.bottom) / textView.font.lineHeight);
    if (!(self.choiceTextLinesCount == rowsCount)) {
        self.choiceTextLinesCount = rowsCount;
        if (self.cellHeight < 25 + rowsCount * textView.font.lineHeight){
            self.cellHeight = 25 + rowsCount * textView.font.lineHeight;
            [self.choicesTableView beginUpdates];
            [self.choicesTableView endUpdates];
        }
    }
    return YES;
}

- (NSInteger)cellRowNumberOfTextView:(UITextView *)textView {
    TestFillTableViewCell *cell = (TestFillTableViewCell*)[[textView superview] superview];
    return [cell.numberLabel.text intValue] - 1;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
   
    NSInteger cellRowNumber = [self cellRowNumberOfTextView:textView];
    [self.choiceStringArray replaceObjectAtIndex:cellRowNumber
                                      withObject:[textView.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
    if (self.isNextPressed) {
        self.isNextPressed = NO;
        Question *question = [Question new];
        question.questionText = self.questionTextView.text;
        for (NSString *choiceText in self.choiceStringArray) {
            Choice *choice = [Choice new];
            choice.choiceText = choiceText;
            [question.choices addObject:choice];
        }
        [self.testPackage.questions addObject:question];
        self.questionTextView.text = @"";
        self.choiceStringArray = @[emptyCellString].mutableCopy;
        [self.choicesTableView reloadData];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    TestFillTableViewCell *cell = (TestFillTableViewCell*) textView.superview.superview;
    [self.choicesTableView scrollToRowAtIndexPath:[self.choicesTableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark - Actions

- (IBAction)nextQuestionAction:(UIButton *)sender {
    self.isNextPressed = YES;
    [self.choicesTableView reloadData];
}

- (IBAction)saveAction:(UIButton *)sender {
    self.isNextPressed = YES;
}

#pragma mark -segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AnswersInputViewController *answerVC = [segue destinationViewController];
    answerVC.testPackage = self.testPackage;
}

@end

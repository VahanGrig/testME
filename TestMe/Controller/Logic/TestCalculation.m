//
//  TestCalculation.m
//  TestMe
//
//  Created by Vahan Grigoryan on 6/11/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "TestCalculation.h"

@interface TestCalculation ()

@end

@implementation TestCalculation

+ (NSInteger)testPointFromAnswerId:(NSString *)answerId andTestName:(NSString*)testName {
    NSInteger testPoint = 0;
    NSString *choiceNumberString = @"";
    if ([testName isEqualToString:@"Are you a nervous person?"]) {
        
        int i = 0;
        while (i < 16) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(15 - i, 1)];
            testPoint += choiceNumberString.integerValue;
            i++;
        }
    } else if ([testName isEqualToString:@"Family Test for Women"]) {
        
        NSArray *answerPoints = @[@[@6, @2, @4], @[@2, @1, @5], @[@5, @6, @2], @[@6, @1, @3], @[@2, @5, @4], @[@5, @4, @1], @[@5, @4, @1], @[@2, @6, @4], @[@4, @6, @3], @[@4, @5, @2], @[@6, @2, @5], @[@5, @1, @2]];
        int i = 0;
        while (i < 12) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(11 - i, 1)];
            NSNumber *pointNumber = [[answerPoints objectAtIndex:i] objectAtIndex: choiceNumberString.integerValue - 1];
            testPoint += [pointNumber intValue];
            i++;
        }
    } else if ([testName isEqualToString:@"Family Test for Men"]) {
        
    } else if ([testName isEqualToString:@"Big Love or easy interest"]) {
        NSArray *answerPoints = @[@2, @3, @1];
        int i = 0;
        while (i < 10) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(9 - i, 1)];
            NSNumber *pointNumber = [answerPoints objectAtIndex:choiceNumberString.integerValue - 1];
            testPoint += [pointNumber integerValue];
            i++;
        }
    } else if ([testName isEqualToString:@"How long will you live?"]) {
        
        NSArray *answerPoints = @[@[@69, @76], @[@0, @2, @2, @3, @4], @[@(-2), @2],
                                  @[@(-3), @3], @[@4, @2], @[@5, @0], @[@(-4), @0], @[@(-3), @0], @[@(-3), @3], @[@1, @(-2)], @[@(-1),  @0], @[@(-2), @0], @[@1, @2], @[@3, @0, @0], @[@2, @4], @[@(-4), @(-3) ,@0], @[@(-8), @(-6), @(-4), @0], @[@(-8), @(-4), @(-2), @0]];
        
        answerPoints = [[answerPoints reverseObjectEnumerator] allObjects];
        NSNumber *age = 0;
        
        int i = 0;
        while (i < 18) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(17 - i, 1)];
            NSNumber *pointNumber = [[answerPoints objectAtIndex:i] objectAtIndex:choiceNumberString.integerValue - 1];
            if (i == 12  && (choiceNumberString.integerValue - 1) != 0) {
                
                age = [@[@25, @35, @45, @55, @65] objectAtIndex:[answerId substringWithRange:NSMakeRange(16, 1)].integerValue - 1];
                pointNumber = [NSNumber numberWithInt:-((age.intValue - 25) / 10)];
            }
            
            testPoint += [pointNumber integerValue];
            i++;
        }
    } else if ([testName isEqualToString:@"What is your creative age?"]) {
        NSInteger countOfAnswer2 = 0;
        NSInteger countOfAnswer3 = 0;
        NSInteger countOfAnswer4 = 0;
        NSInteger countOfAnswer5 = 0;
        
        int i = 0;
        while (i < 10) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(9 - i, 1)];
            switch (choiceNumberString.integerValue) {
                case 2:
                    countOfAnswer2++;
                    break;
                case 3:
                    countOfAnswer3++;
                    break;
                case 4:
                    countOfAnswer4++;
                    break;
                case 5:
                    countOfAnswer5++;
                    break;
                default:
                    break;
            }
            i++;
        }
        testPoint = 2 * (countOfAnswer2 + 3 * countOfAnswer3 + 4 * countOfAnswer4 + 2 * countOfAnswer5);
    } else if ([testName isEqualToString:@"Your creative potential."]) {
        
        NSArray *answerPoints = @[@3, @1, @2];
        
        int i = 0;
        while (i < 18) {
            choiceNumberString = [answerId substringWithRange:NSMakeRange(17 - i, 1)];
            NSNumber *pointNumber = [answerPoints objectAtIndex: choiceNumberString.integerValue - 1];
            testPoint += [pointNumber intValue];
            i++;
        }
    } else if ([testName isEqualToString:@"Optimist or pessimist."]) {
        NSArray *answerPoints = @[@[@3, @1, @5, @4, @0], @[@2, @5, @3, @1, @2], @[@3, @1, @2, @4, @0], @[@2, @1, @4, @2, @0], @[@5, @2, @3, @4, @0], @[@2, @1, @4, @3, @0], @[@3, @2, @1, @5, @0], @[@5, @2, @3, @2, @0], @[@1, @2, @5, @4, @0], @[@5, @2, @3, @1, @0], @[@2, @1, @5, @3, @0], @[@5, @2, @3, @2, @0], @[@1, @5, @3, @2, @0], @[@1, @5, @2, @4, @0], @[@5, @1, @3, @3, @0], @[@3, @1, @2, @4, @0], @[@2, @1, @4, @4, @0], @[@5, @2, @3, @1, @0], @[@2, @5, @2, @4, @1], @[@1, @4, @3, @5, @0]];
        
        NSString *answerPointString = answerId;
        
        int i = 0;
        while (i < 20) {
            answerPointString = [answerId substringWithRange:NSMakeRange(19 - i, 1)];
            NSNumber *pointNumber = [[answerPoints objectAtIndex:i] objectAtIndex: answerPointString.integerValue - 1];
            testPoint += [pointNumber intValue];
            i++;
        }
    }
    return testPoint;
}

+ (NSArray *)testPointComponentsFromAnswerId:(NSString *)answerId andTestName:(NSString *)testName {
    if ([testName isEqualToString:@"Your temper."]) {
        NSString *answerPointString = answerId;
        NSInteger allPositiveAnswerCount = 0;
        NSInteger phlegmaticCount = 0;
        NSInteger cholericCount = 0;
        NSInteger sanguineCount = 0;
        NSInteger melancholicCount = 0;
        
        int i = 0;
        while (i < 80) {
            answerPointString = [answerId substringWithRange:NSMakeRange(79 - i, 1)];
            NSInteger positiveAnswer = answerPointString.integerValue == 1 ? 1 : 0;
            allPositiveAnswerCount += positiveAnswer;
            if (i <= 19) {
                melancholicCount += positiveAnswer;
            } else if (i > 19 && i <= 39) {
                phlegmaticCount += positiveAnswer;
            } else if (i > 39 && i <= 59) {
                sanguineCount += positiveAnswer;
            } else if (i > 59 && i <= 79) {
                cholericCount += positiveAnswer;
            }
            i++;
        }
    NSArray *testPointsArray = @[@(cholericCount * 100 / allPositiveAnswerCount),@(sanguineCount * 100 / allPositiveAnswerCount), @(phlegmaticCount * 100 / allPositiveAnswerCount), @(melancholicCount * 100 / allPositiveAnswerCount)];
        return testPointsArray;
    }
    return nil;
}

@end

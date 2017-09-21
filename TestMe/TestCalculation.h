//
//  TestCalculation.h
//  TestMe
//
//  Created by Vahan Grigoryan on 6/11/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCalculation : UIViewController

+ (NSInteger)testPointFromAnswerId:(NSString *)answerId andTestName:(NSString*)testName;
+ (NSArray *)testPointComponentsFromAnswerId:(NSString *)answerId andTestName:(NSString *)testName;

@end

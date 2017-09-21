//
//  RLMTestPackage.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <Realm/Realm.h>
#import "Choice.h"
#import "Question.h"

@interface RLMTestPackage : RLMObject

@property NSString            *categoryName;
@property NSString            *subCategoryName;
@property RLMArray<Question>  *questions;
@property RLMArray<Answer>    *answers;

@end
RLM_ARRAY_TYPE(RLMTestPackage)

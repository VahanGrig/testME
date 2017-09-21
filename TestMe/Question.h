//
//  Question.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/24/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <Realm/Realm.h>
#import "Choice.h"
#import "Answer.h"

@interface Question : RLMObject

@property NSString          *questionText;
@property RLMArray <Choice> *choices;

@end
RLM_ARRAY_TYPE(Question)

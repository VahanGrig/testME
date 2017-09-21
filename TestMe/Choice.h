//
//  Choices.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/24/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <Realm/Realm.h>

@interface Choice : RLMObject

@property NSString *choiceText;

@end
RLM_ARRAY_TYPE(Choice)

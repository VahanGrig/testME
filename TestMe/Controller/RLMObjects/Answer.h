//
//  Answer.h
//  TestMe
//
//  Created by Vahan Grigoryan on 4/24/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <Realm/Realm.h>

@interface Answer : RLMObject

@property NSString *imageName;
@property NSString *answareText;
@property NSString *answareID;
@property NSString *points;

@end
RLM_ARRAY_TYPE(Answer)

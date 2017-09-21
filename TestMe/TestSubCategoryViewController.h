//
//  TestSubCategoryViewController.h
//  TestMe
//
//  Created by Vahan Grigoryan on 5/20/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "RLMTestPackage.h"

@interface TestSubCategoryViewController : UIViewController

@property (nonatomic, strong) RLMResults <RLMTestPackage *> *categoryArray;
@property (nonatomic, copy) NSString *cellTextColorString;
@property (nonatomic, copy) NSString *controllerTitle;

@end

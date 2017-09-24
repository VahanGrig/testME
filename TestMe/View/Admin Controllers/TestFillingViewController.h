//
//  TestFillingViewController.h
//  TestMe
//
//  Created by Vahan Grigoryan on 5/11/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMTestPackage.h"
#import <Realm/Realm.h>

@interface TestFillingViewController : UIViewController

@property (nonatomic, strong) RLMResults <RLMTestPackage *> *categoryArray;
@property (nonatomic, copy) NSString *controllerTitle;
@property (nonatomic, copy) NSString *subCategoryString;
@property (weak, nonatomic) IBOutlet UITableView *fillTableView;
@property (weak, nonatomic) IBOutlet UILabel *questionText;

@end

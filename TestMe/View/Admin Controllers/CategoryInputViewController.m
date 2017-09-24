//
//  CategoryInputViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/29/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "CategoryInputViewController.h"
#import "TestQuestionInputViewController.h"
#import "RLMTestPackage.h"

@interface CategoryInputViewController () <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, copy) NSString *categoryString;
@property (nonatomic, strong) NSArray *categoryTypeArray;
@property (nonatomic, strong) RLMTestPackage *testPackage;
@property (nonatomic, strong) RLMResults *testPackageArray;
@property (nonatomic, strong) RLMRealm *realm;

@end

@implementation CategoryInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testPackage = [RLMTestPackage new];
    self.categoryString = @"Pick Category";
    self.categoryTypeArray = @[@"Pick Category", @"Health", @"Love", @"Nature", @"Mind"];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.categoryTypeArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.categoryTypeArray objectAtIndex:row];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.categoryString = [self.categoryTypeArray objectAtIndex:row];
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* tView = (UILabel*)view;
    if (!tView) {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [tView setTextAlignment:NSTextAlignmentCenter];
        tView.numberOfLines=3;
    }
    tView.text = [self.categoryTypeArray objectAtIndex:row];
    return tView;
}

- (IBAction)nextAction:(UIButton *)sender {
    if (![self.categoryString isEqualToString:@"Pick Category"] &&
        ![self.testHeaderField.text isEqualToString:@""]) {
        self.testPackage.categoryName = self.categoryString;
        self.testPackage.subCategoryName = self.testHeaderField.text;
        [self performSegueWithIdentifier:@"choice" sender:self];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops"
                             message:@"Pick test category \n or \n fill the Test Header"
                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TestQuestionInputViewController *questionVC = [segue destinationViewController];
    questionVC.testPackage = self.testPackage;
}

@end

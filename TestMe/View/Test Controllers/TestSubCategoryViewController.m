//
//  TestSubCategoryViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 5/20/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "TestSubCategoryViewController.h"
#import "TestFillingViewController.h"
#import "SubCategoryCell.h"
#import "UIColor+Utility.h"

@interface TestSubCategoryViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *categoryCollorArray;
@property (nonatomic, strong) NSArray *categoryNameArray;
@property (nonatomic, strong) NSMutableArray *questionsArray;

@end

@implementation TestSubCategoryViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionsArray = [NSMutableArray array];
    for (RLMTestPackage *testPackage in self.categoryArray) {
        if ([testPackage.categoryName isEqualToString:self.controllerTitle]) {
            [self.questionsArray addObject:testPackage];
        }
    }
    
    //self.categoryCollorArray = @[@"#01514E", @"#7B978F", @"#E19B46", @"#E10045", @"#FC2F20", @"#F87800", @"#FDB341", @"#FF6938"];
    //self.categoryNameArray = @[@"Flirting", @"Dating", @"Relation", @"Marriage"];
    self.navigationController.navigationBar.barTintColor = [UIColor colorFromHexString:self.cellTextColorString];
    
    self.title = self.controllerTitle;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.collectionView registerClass:[SubCategoryCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:nil
                                                                     action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.questionsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SubCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textcolor = [UIColor colorFromHexString:self.cellTextColorString];
    RLMTestPackage *testpackage = [self.questionsArray objectAtIndex:indexPath.row];
    [cell createCellWithText:testpackage.subCategoryName];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width - 24, (self.view.frame.size.height - 48) / 4);
}

-(void)viewDidLayoutSubviews{
    self.collectionView.contentInset = UIEdgeInsetsMake(12, 12, 0, 12);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"choice" sender:[self.questionsArray objectAtIndex:indexPath.row]];
}

#pragma mark -segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"choice"]) {
        TestFillingViewController *vc = [segue destinationViewController];
        vc.categoryArray = self.categoryArray;
        vc.controllerTitle = self.controllerTitle;
        vc.subCategoryString = ((RLMTestPackage *)sender).subCategoryName;
    }
}

@end

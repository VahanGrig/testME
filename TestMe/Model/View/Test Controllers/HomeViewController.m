//
//  HomeViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "HomeViewController.h"
#import "TestSubCategoryViewController.h"
#import "TestCategoryCell.h"
#import "UIColor+Utility.h"
#import "RLMTestPackage.h"
#import <Realm/Realm.h>

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *categoryCollorArray;
@property (nonatomic, strong) NSArray *categoryNameArray;
@property (nonatomic, strong) RLMResults <RLMTestPackage *> *categoryArray;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionvVew;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeViewController

static NSString *encriptionKeyString = @"oIN6qxTKwvdYb39+gjvcXoOQdiECOT4n4IQfGE98eyDE+lUJILsn319J12yXyMGC1CuWEj3izXbITp5O87VLQQ==";

- (void)viewDidLoad {
    [super viewDidLoad];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSBundle *main = [NSBundle mainBundle];
    NSURL *resourcePath = [main URLForResource:@"realmexaple" withExtension:@"realm"];
    NSURL *rlmDefaultUrl = config.fileURL;
    config.encryptionKey = [[NSData alloc] initWithBase64EncodedString:encriptionKeyString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    [RLMRealmConfiguration setDefaultConfiguration:config];
    [[NSFileManager defaultManager] fileExistsAtPath:resourcePath.absoluteString];
    [[[NSFileManager defaultManager] attributesOfItemAtPath:rlmDefaultUrl.relativeString error:nil] fileSize];
    [[NSFileManager defaultManager] removeItemAtURL:rlmDefaultUrl error:nil];
    [[NSFileManager defaultManager] copyItemAtURL:resourcePath toURL:rlmDefaultUrl error:nil];
    self.categoryArray = [[RLMTestPackage allObjects] sortedResultsUsingKeyPath:@"categoryName" ascending:YES];
    NSMutableArray *categoryNameArray = [NSMutableArray array];
    for (RLMTestPackage *testPackage in self.categoryArray) {
        [categoryNameArray addObject:testPackage.categoryName];
    }
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:categoryNameArray];
    self.categoryNameArray = [orderedSet array];
    self.categoryCollorArray = @[@"#FF5C3C", @"#FF3558", @"#FFD243", @"#89DD67"];
    //self.categoryNameArray = @[@"Love", @"Mind", @"Health", @"Nature"];
    
    [self.collectionvVew registerClass:[TestCategoryCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self configureNavigationBar];
}

- (void)configureNavigationBar {
    self.title = @"TestMe";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor colorFromHexString:@"#FF4900"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.categoryNameArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    TestCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell updateCellWithColor:[UIColor colorFromHexString:[self.categoryCollorArray objectAtIndex:indexPath.row]] andText:[self.categoryNameArray objectAtIndex:indexPath.row]];
    cell.layer.cornerRadius = 4;
   
    return cell;
}

#pragma mark -UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width / 2 - 18, self.view.frame.size.width / 2 - 60);
}

-(void)viewDidLayoutSubviews{
    self.collectionvVew.contentInset = UIEdgeInsetsMake(12, 12, 12, 12);
   CGFloat hight = (self.view.frame.size.width - 84);
    self.imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, CGRectGetHeight(self.view.bounds) - hight);
    self.collectionvVew.frame = CGRectMake(0, CGRectGetMaxY(self.view.bounds) - hight, self.view.bounds.size.width, hight);
}

#pragma mark -segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"love"])
    {
        TestSubCategoryViewController *vc = [segue destinationViewController];
        vc.categoryArray = self.categoryArray;
        vc.cellTextColorString = [self.categoryCollorArray objectAtIndex:[sender row]];
        vc.controllerTitle = [self.categoryNameArray objectAtIndex:[sender row]];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        [self performSegueWithIdentifier:@"love" sender:indexPath];
}

@end

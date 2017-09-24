//
//  LoveViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/22/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "LoveViewController.h"
#import "UIColor+Utility.h"
#import "LoveCell.h"

@interface LoveViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *categoryCollorArray;
@property (nonatomic, strong) NSArray *categoryNameArray;

@end

@implementation LoveViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryCollorArray = @[@"#01514E", @"#7B978F", @"#E19B46", @"#E10045", @"#FC2F20", @"#F87800", @"#FDB341", @"#FF6938"];
    self.categoryNameArray = @[@"Flirting", @"Dating", @"Relation", @"Marriage"];
    
   // self.navigationController.navigationBar.barTintColor = [UIColor colorFromHexString:@"#16333A"];
    self.title = @"TestMe";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.collectionView registerClass:[LoveCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LoveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell updateCellWithColor:[UIColor colorFromHexString:[self.categoryCollorArray objectAtIndex:indexPath.row + 3]] andText:[self.categoryNameArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 155);
}

-(void)viewDidLayoutSubviews{
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 2, 0, 2);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

@end

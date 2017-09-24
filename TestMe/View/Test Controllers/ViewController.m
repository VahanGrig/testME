//
//  ViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/19/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Utility.h"

typedef BOOL(^MyCompletionBlock)();

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *letterColorsArray;
@property (nonatomic, assign) NSInteger animationNumber;
@property (nonatomic, assign) BOOL isAnimationOver;

@end

@implementation ViewController
static NSInteger letterWidth = 50;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    mainImageView.image = [UIImage imageNamed:@"main_screen"];
    mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:mainImageView];
    
    NSMutableArray *testMe = @[@"T",@"e",@"s",@"t",@"M",@"E",@"#"].mutableCopy;
    self.letterColorsArray = @[@"#FF5722",@"#FF7F22",@"#FFA622",@"#2270FF",@"#22FFB6"];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100 , self.view.frame.size.width, 50)];
    
    
    
    CGPoint position = CGPointMake(0, 0);
    NSString *letter = @"";
    for ( int i = 0; i < [testMe count] - 3; i++) {
        position.x = i;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 125 + position.x * letterWidth, CGRectGetMidY(self.view.frame) - 50, 50, 50)];
        scrollView.contentSize = CGSizeMake(50, 500);
        
        for (int j = 0; j < [testMe count]; j++) {
            position.y = j;
            
            if (j == 0) {
                letter = @"#";
            } else if (j == [testMe count] - 1) {
                letter = [testMe objectAtIndex:i];
            } else {
                letter = [testMe objectAtIndex:arc4random_uniform([testMe count] - 0.f)];}
            [self addLetter:letter toScrollView:scrollView forPosition:position];
        }
        [self  scrollviewAnimation:scrollView withDuration:0.6f + i*0.25];
    }
}

- (void)addLetter:(NSString *)letter toScrollView:(UIScrollView *)scrollView forPosition:(CGPoint)position  {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, position.y * letterWidth, letterWidth, letterWidth)];
    [textLabel setText:letter];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setFont:[UIFont boldSystemFontOfSize:70]];
    textLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:textLabel];
    [self.view addSubview:scrollView];
    
}

- (void)scrollviewAnimation:(UIScrollView *)scrollView withDuration:(NSTimeInterval)duration {
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [scrollView scrollRectToVisible:CGRectMake(0, 300, self.view.frame.size.width, 50) animated:YES];
        
    } completion:^(BOOL finished) {
        __strong typeof(self)self = weakSelf;
        self.animationNumber += 1;
        if (self.animationNumber == 3) {
            [self labelAnimation];
        }
    }];
}

- (void)labelAnimation {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) + 50, CGRectGetMidY(self.view.frame) - 200 , 100, 50)];
    [label setText:@"ME"];
    [label setFont:[UIFont boldSystemFontOfSize:70]];
    [label setTextColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    [UIView animateWithDuration:1
                     animations:^{
                         label.transform = CGAffineTransformRotate(label.transform,  1.57);
                         label.frame = CGRectMake(CGRectGetMidX(self.view.frame) + 50, CGRectGetMidY(self.view.frame) - 25 , 50, 100);
                     }
                     completion:^(BOOL finished) {
                         [self performSegueWithIdentifier:@"Login" sender:self];
                     }];
}



@end

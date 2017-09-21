//
//  LoginViewController.m
//  TestMe
//
//  Created by Vahan Grigoryan on 4/21/17.
//  Copyright © 2017 AVH. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startTestButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startTestButton.layer.cornerRadius = 4.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTestButton:(id)sender {
    [self performSegueWithIdentifier:@"Home" sender:self];

}
@end

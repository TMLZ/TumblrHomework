//
//  HomeViewController.m
//  TumblrHomework
//
//  Created by Tyler Miller on 7/8/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *logInViewContainer;
@property (weak, nonatomic) IBOutlet UIView *logInFormContainer;
- (IBAction)onLogInButton:(UIButton *)sender;
- (IBAction)onCancelLogInButton:(UIButton *)sender;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set LogInViewContainer alpha to 0
    self.logInViewContainer.alpha = 0.0f;
    
    //Offset LogInFormContainer
    self.logInFormContainer.center = CGPointMake(160, 1000);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogInButton:(UIButton *)sender {
    
    [UIView animateWithDuration:.5 animations:^{
        
        // Show Login Form
        self.logInViewContainer.alpha = 1.0f;
        self.logInFormContainer.center = CGPointMake(160, 218);
    }];
     };

- (IBAction)onCancelLogInButton:(UIButton *)sender {
    
    //Remove LogInView
    [UIView animateWithDuration:.3 animations:^{
        
        // Remove Login Form
        self.logInViewContainer.alpha = 0.0f;
        self.logInFormContainer.center = CGPointMake(160, 1000);
        
        // Remove Keyboard

    }];
};


@end

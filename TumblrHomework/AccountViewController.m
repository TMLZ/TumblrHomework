//
//  AccountViewController.m
//  TumblrHomework
//
//  Created by Tyler Miller on 7/8/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "AccountViewController.h"
#import "HomeViewController.h"

@interface AccountViewController ()
- (IBAction)onLogInButton:(UIButton *)sender;

@end

@implementation AccountViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogInButton:(UIButton *)sender {
    
    // Push HomeVC
    
    // Change opacity of LogInViewContainer
}

@end

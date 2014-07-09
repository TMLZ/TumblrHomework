//
//  TabBarViewController.m
//  TumblrHomework
//
//  Created by Tyler Miller on 7/8/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "TabBarViewController.h"

// Import VCs for TBC
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "AccountViewController.h"
#import "TrendingViewController.h"

@interface TabBarViewController ()

// Set up VCs as properties of TBC
@property (nonatomic,strong) HomeViewController *homeViewController;
@property (nonatomic,strong) SearchViewController *searchViewController;
@property (nonatomic,strong) AccountViewController *accountViewController;
@property (nonatomic,strong) TrendingViewController *trendingViewController;

// Set up ContentView as an outlet
@property (weak, nonatomic) IBOutlet UIView *contentView;

// Set up CurrentView to detect the view in CurrentView
@property (nonatomic,strong) UIView *currentView;

@property (nonatomic, assign) BOOL bounceToggle;

// Set up TBC Buttons
- (IBAction)onHomeButton:(UIButton *)sender;
- (IBAction)onSearchButton:(UIButton *)sender;
- (IBAction)onComposeButton:(UIButton *)sender;
- (IBAction)onAccountButton:(UIButton *)sender;
- (IBAction)onTrendingButton:(UIButton *)sender;


// Set up PopOver ImageView
@property (weak, nonatomic) IBOutlet UIImageView *popOverImageView;

// Set up Compose Screen
@property (weak, nonatomic) IBOutlet UIView *composeBlueScreen;

// Set up Compose Button Container
@property (weak, nonatomic) IBOutlet UIView *composeButtonContainer;

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Instantiate VCs
        self.homeViewController = [[HomeViewController alloc] init];
        self.searchViewController = [[SearchViewController alloc] init];
        self.accountViewController = [[AccountViewController alloc] init];
        self.trendingViewController = [[TrendingViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set HomeVC as default Subview in ContentView
    // [self.contentView addSubview:self.homeViewController.view];
    
    // Call onHomeButton method - if sender is used in onHomeButton, 'nil' may cause problems
    [self onHomeButton:nil];
    
    // Set Compose Screen Alpha
    self.composeBlueScreen.alpha = 0.0f;
    
    // Set Compose Buttons Offset
    self.composeButtonContainer.center = CGPointMake(160, 1000);
    
    // Animate Loop for Popover
    [self animatePopoverBounce:self.popOverImageView];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButton:(UIButton *)sender {
    
    // Call Animation to change VC
    [self animateInViewController:self.homeViewController.view];
    
}

- (IBAction)onSearchButton:(UIButton *)sender {
    
    // Call Animation to change VC
    [self animateInViewController:self.searchViewController.view];
    
    // Set popOver Alpha to 0
    self.popOverImageView.alpha = 0;
    
}

- (IBAction)onComposeButton:(UIButton *)sender {
    
    // Set PopOver Alpha
    self.popOverImageView.alpha = 0.0f;
    
    // Set Screen Alpha
    self.composeBlueScreen.alpha = 0.9f;
   
    // Animate ComposeButtons Container on Screen
    
    [UIView animateWithDuration:.5 delay:.3 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.composeButtonContainer.center = CGPointMake(160, 271);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)onAccountButton:(UIButton *)sender {
    
    // Call Animation to change VC
    [self animateInViewController:self.accountViewController.view];
    
}

- (IBAction)onTrendingButton:(UIButton *)sender {
    
    // Call Animation to change VC
    [self animateInViewController:self.trendingViewController.view];
    
}

// Refactor animation to call VCs
- (void)animateInViewController:(UIView *)view {
    
    // Check if called VC is already in ContentView
    if (self.currentView == view) {
        return;
    }
    
    self.currentView = view;
    
    // Animate in PopOver
    if (self.popOverImageView.alpha != 1.0f)
    {
        self.popOverImageView.alpha = 0.0f;
        
        [UIView animateWithDuration:.5 delay:.3 options:UIViewAnimationOptionCurveLinear animations:^{
            
            // Change PopOver Alpha to 1
            self.popOverImageView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    // Set incoming VC off-screen
    view.frame = CGRectMake(0, 568, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    view.frame = self.contentView.frame;
        
    } completion:nil];
    
    // Change Subview to desired view or Bring View To Front
    [self.contentView addSubview:view];
    
}

- (void)animatePopoverBounce:(UIView *)view {
    [UIView animateWithDuration:.8 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
        
        // Move PopOver down
        if (self.bounceToggle) {
            self.popOverImageView.center = CGPointMake(self.popOverImageView.center.x, self.popOverImageView.center.y + 5);
            self.bounceToggle = NO;
        }
        else {
            self.popOverImageView.center = CGPointMake(self.popOverImageView.center.x, self.popOverImageView.center.y - 5);
            self.bounceToggle = YES;
        }
        
    } completion:^(BOOL result){
        [self animatePopoverBounce:self.popOverImageView];
    }];
}

@end

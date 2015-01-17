//
//  GravityViewController.m
//  2.1. Adding Gravity to Your UI Components
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation GravityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /* Create our little square view and add it to self.view */
    self.squareView = [[UIView alloc] initWithFrame:
                       CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;
    [self.view addSubview:self.squareView];
    /* Create the animator and the gravity */
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
                                  initWithItems:@[self.squareView]];
    [self.animator addBehavior:gravity];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

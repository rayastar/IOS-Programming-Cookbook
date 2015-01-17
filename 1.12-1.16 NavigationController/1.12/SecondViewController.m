//
//  SecondViewController.m
//  1.12
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Second";
        self.tabBarItem.image = [UIImage imageNamed:@"SecondTab.png"];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Second Controller";
    self.displaySecondViewController = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    [self.displaySecondViewController
     setTitle:@"Display Third View Controller"
     forState:UIControlStateNormal];
    [self.displaySecondViewController sizeToFit];
    self.displaySecondViewController.center = self.view.center;
    [self.displaySecondViewController
     addTarget:self action:@selector(performDisplaySecondViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displaySecondViewController];
    // Do any additional setup after loading the view from its nib.
}

- (void) performDisplaySecondViewController:(id)paramSender{
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]
                                              initWithNibName:nil
                                              bundle:NULL];
    [self.navigationController pushViewController:thirdViewController
                                         animated:YES];
}

@end

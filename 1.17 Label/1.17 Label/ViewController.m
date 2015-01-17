//
//  ViewController.m
//  1.17 Label
//
//  Created by marat on 12/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect labelFrame = CGRectMake(0.0f, 0.0f, 100.0f, 40.0f);
    self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.myLabel.text = @"iOS 7 Programming Cookbookkk";
    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    self.myLabel.center = self.view.center;
    [self.view addSubview:self.myLabel];
    self.myLabel.numberOfLines = 3;
    //self.myLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.myLabel.adjustsFontSizeToFitWidth = YES;
    
    self.myLabel.shadowColor = [UIColor redColor];
    self.myLabel.shadowOffset = CGSizeMake(2.0f, 2.0f);
	self.myLabel.textColor = [UIColor blackColor];
    self.myLabel.shadowColor = [UIColor lightGrayColor];
    self.myLabel.shadowOffset = CGSizeMake(2.0f, 2.0f);
    [self.myLabel sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

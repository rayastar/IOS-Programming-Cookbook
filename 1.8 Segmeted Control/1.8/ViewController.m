//
//  ViewController.m
//  1.8
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISegmentedControl *mySegmentedControl;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray *segments = [[NSArray alloc] initWithObjects:
                         @"iPhone",
                         @"iPad",
                         @"iPod",
                         @"iMac", nil];
    
    self.mySegmentedControl = [[UISegmentedControl alloc]
                               initWithItems:segments];
    self.mySegmentedControl.center = self.view.center;
    [self.view addSubview:self.mySegmentedControl];
    self.mySegmentedControl.momentary = YES;
    
   
    
//    self.mySegmentedControl = [[UISegmentedControl alloc]
//                               initWithItems:segments];
//    self.mySegmentedControl.center = self.view.center;
//    [self.view addSubview:self.mySegmentedControl];
//    //rself.mySegmentedControl.transform = CGAffineTransformMakeRotation(M_PI / 3.0);
    [self.mySegmentedControl addTarget:self action:@selector(segmentChanged:)
                      forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void) segmentChanged:(UISegmentedControl *)paramSender
{
    if ([paramSender isEqual:self.mySegmentedControl])
    {
        NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
        NSString  *selectedSegmentText =
        [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
        NSLog(@"Segment %ld with %@ text is selected", (long)selectedSegmentIndex, selectedSegmentText);
    }
}

@end

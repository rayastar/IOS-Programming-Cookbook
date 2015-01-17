//
//  ViewController.m
//  1.21 Button
//
//  Created by marat on 13/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    self.myButton.frame = CGRectMake(110.0f,
                                     200.0f,
                                     100.0f,
                                     44.0f);
    [self.myButton setTitle:@"Press Me"
                   forState:UIControlStateNormal];
    [self.myButton setTitle:@"I'm Pressed"
                   forState:UIControlStateHighlighted];
    [self.myButton addTarget:self action:@selector(buttonIsPressed:)
            forControlEvents:UIControlEventTouchDown];
    [self.myButton addTarget:self
                      action:@selector(buttonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.myButton];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) buttonIsPressed:(UIButton *)paramSender{
    NSLog(@"Button is pressed.");
}

- (void) buttonIsTapped:(UIButton *)paramSender{
    NSLog(@"Button is tapped.");
}

@end

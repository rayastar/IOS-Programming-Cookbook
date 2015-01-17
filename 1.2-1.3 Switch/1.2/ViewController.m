//
//  ViewController.m
//  1.2
//
//  Created by marat on 03/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 55, 60)];
    [self.view addSubview:self.mainSwitch];
    [self.mainSwitch setOn:YES animated:YES];
    
    /* Adjust the off-mode tint color */
    self.mainSwitch.tintColor = [UIColor redColor];
    /* Adjust the on-mode tint color */
    self.mainSwitch.onTintColor = [UIColor brownColor];
    /* Also change the knob's tint color */
    self.mainSwitch.thumbTintColor = [UIColor greenColor];
    
    if ([self.mainSwitch isOn]) {
        
        NSLog(@"yes");
    } else {
        NSLog(@"No");
       
    }
    
    [self.mainSwitch addTarget:self action:@selector(switchIsChanged:)
              forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) switchIsChanged:(UISwitch *)paramSender{
  //  NSLog(@"Sender is = %@", paramSender);
    if ([paramSender isOn]){
        NSLog(@"The switch is turned on.");
    }else{
        NSLog(@"The switch is turned off.");
    } }


@end

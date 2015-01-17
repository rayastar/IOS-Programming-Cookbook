//
//  ViewController.m
//  1.6
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 23)];
    self.slider.center = self.view.center;
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 100;
    self.slider.value = 50;
    [self.view addSubview:self.slider];
    /* Set the tint color of the minimum value */
    self.slider.minimumTrackTintColor = [UIColor redColor];
    /* Set the tint color of the thumb */
    self.slider.maximumTrackTintColor = [UIColor greenColor];
    /* Set the tint color of the maximum value */
    self.slider.thumbTintColor = [UIColor blackColor];
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:)  forControlEvents:UIControlEventValueChanged];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 150, 44)];
    self.label.text = [NSString stringWithFormat:@"hello"];
    [self.view addSubview:self.label];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

     
 - (void) sliderValueChanged:(UISlider *)paramSender{
     if ([paramSender isEqual:self.slider])
     {
         //NSLog(@"New value = %f", paramSender.value);
      __unused   float a = round(paramSender.value);
        self.label.text = [NSString stringWithFormat: @"%f", paramSender.value];
     }
     
//     if (paramSender.value == 60)
//     {
//         
//         UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Change Password"
//                                                          message:@""
//                                                         delegate:self
//                                                cancelButtonTitle:@"Cancel"
//                                            otherButtonTitles:@"OK", nil];
//         [alert show];
//         
//     }
 }
     
@end

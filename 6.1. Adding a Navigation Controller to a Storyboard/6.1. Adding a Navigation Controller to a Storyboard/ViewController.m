//
//  ViewController.m
//  6.1. Adding a Navigation Controller to a Storyboard
//
//  Created by marat on 05/02/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad]; self.title = @"First Screen";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void) displayTextIsRequired{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:@"Please enter some text in the text field"
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
}
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    /* Check if there is some text and if there isn't, display a message
     to the user and prevent her from going to the next screen */
    if ([identifier isEqualToString:@"pushSecondViewController"]){
        if ([self.textField.text length] == 0){ [self displayTextIsRequired];
            return NO;
        }
    };
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"pushSecondViewController"]){
            SecondViewController *nextController = segue.destinationViewController;
        [nextController setText:self.textField.text];
    }
}
@end

//
//  ViewController.m
//  1.1
//
//  Created by marat on 03/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h" //<UIAlertViewDelegate>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[super viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Press:(id)sender {
    
    [self alertTwo];
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    __unused  NSString *textOfTitle = [alertView title];
    
    //__unused NSString *name = [alertView textFieldAtIndex:0].text;
    
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self yesButtonTitle]]){ NSLog(@"User pressed the Yes button.");
    }
    else if ([buttonTitle isEqualToString:[self noButtonTitle]]){
        NSLog(@"User pressed the No button.");
    }
}


- (NSString *) yesButtonTitle {
    return @"Yes";
}

- (NSString *) noButtonTitle {
    return @"No";
}


    //designated initializer. viewDidAppear: Notifies the view controller that its view was added to a view hierarchy.
//- (void) viewDidAppear:(BOOL)paramAnimated
//{
//
//    UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Alert"
//                              message:@"You've been delivered an alert"
//                              delegate:nil
//                              cancelButtonTitle:@"Cancel"
//                              otherButtonTitles:@"Ok", @"Other button", nil];
//  
//      [alert show];
// 
//}

- (void) alertOne
{

    UIAlertView *aletrshow = [[UIAlertView alloc]
                              initWithTitle:@"Open Link"
                              message:@"Are you sure you want to open this link in Safari?"
                              delegate:self
                              cancelButtonTitle:[self noButtonTitle]
                              otherButtonTitles:[self yesButtonTitle], nil];
    [aletrshow show];


}

- (void) alertTwo
{
    
    UIAlertView *aletrshow = [[UIAlertView alloc]
                              initWithTitle:@"Credit Card Number"
                              message:@"Please enter your credit card number:"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Ok", nil];
    
     [aletrshow setAlertViewStyle:UIAlertViewStylePlainTextInput];
    /* Display a numerical keypad for this text field */
    UITextField *textField = [aletrshow textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [aletrshow show];
    
}


@end
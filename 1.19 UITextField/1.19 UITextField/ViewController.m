//
//  ViewController.m
//  1.19 UITextField
//
//  Created by marat on 12/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect textFieldFrame = CGRectMake(0.0f,
                                       0.0f,
                                       200.0f,
                                       20.0f);
    self.myTextField = [[UITextField alloc]
                        initWithFrame:textFieldFrame];
    self.myTextField.delegate = self;
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    self.myTextField.textAlignment = NSTextAlignmentCenter;
    self.myTextField.text = @"Sir Richard Branson";
    self.myTextField.center = self.view.center;
    self.myTextField.clearButtonMode = YES;
    [self.view addSubview:self.myTextField];
    self.myTextField.placeholder = @"Enter text here...";
    
    CGRect labelCounterFrame = self.myTextField.frame;
    labelCounterFrame.origin.y += textFieldFrame.size.height - 100;
    self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
    [self.view addSubview:self.labelCounter];
    [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
    
    self.currencyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    //currencyLabel.text = [[[NSNumberFormatter alloc] init] currencySymbol];
    self.currencyLabel.text = @"... ";
    self.currencyLabel.font = self.myTextField.font;
    [self.currencyLabel sizeToFit];
    self.myTextField.rightView = self.currencyLabel;
    self.myTextField.rightViewMode = UITextFieldViewModeAlways;

    
    self.currencyLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.currencyLabel addGestureRecognizer:recognizer];
    

}

- (void)tapAction {
    
    //NSLog(@"tap performed");
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Alert"
                          message:@"You've been delivered an alert"
                          delegate:nil
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Ok", @"Other button", nil];
    [alert show];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *) myTextField {
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)myTextField {
    
    return YES;
}


- (void) calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText{
    NSString *characterOrCharacters = @"Characters"; if ([paramText length] == 1){
        characterOrCharacters = @"Character";
    }
    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@", (unsigned long)[paramText length],
                              characterOrCharacters];
}
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
 replacementString:(NSString *)string{
    if ([textField isEqual:self.myTextField]){
        NSString *wholeText =
        [textField.text stringByReplacingCharactersInRange:range
                                                withString:string];
        [self calculateAndDisplayTextFieldLengthWithText:wholeText];
    }
    return YES; }

- (BOOL)textFieldShouldReturn:(UITextField *)textField{ [textField resignFirstResponder];
    return YES;
}


@end


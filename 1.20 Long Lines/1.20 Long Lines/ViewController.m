//
//  ViewController.m
//  1.20 Long Lines
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
    
//    self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
//    self.myTextView.text = @"Some text here...";
//    self.myTextView.contentInset = UIEdgeInsetsMake(10.0f, 0.0f, 0.0f, 0.0f);
//    self.myTextView.font = [UIFont systemFontOfSize:16.0f];
//    [self.view addSubview:self.myTextView];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) handleKeyboardDidShow:(NSNotification *)paramNotification{
    /* Get the frame of the keyboard */
    NSValue *keyboardRectAsObject =
    [[paramNotification userInfo]
     objectForKey:UIKeyboardFrameEndUserInfoKey]; /* Place it in a CGRect */
    CGRect keyboardRect = CGRectZero;
    [keyboardRectAsObject getValue:&keyboardRect];
    /* Give a bottom margin to our text view that makes it
     reach to the top of the keyboard */
    self.myTextView.contentInset =
    UIEdgeInsetsMake(0.0f,
                     0.0f,
                     keyboardRect.size.height,
                     0.0f);
}

- (void) handleKeyboardWillHide:(NSNotification *)paramNotification{
    /* Make the text view as big as the whole view again */
    self.myTextView.contentInset = UIEdgeInsetsZero;
}
- (void) viewWillAppear:(BOOL)paramAnimated{
    [super viewWillAppear:paramAnimated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.myTextView.text = @"Some text here...";
    self.myTextView.font = [UIFont systemFontOfSize:16.0f];
    [self.view addSubview:self.myTextView];
}

- (void) viewWillDisappear:(BOOL)paramAnimated{
    [super viewWillDisappear:paramAnimated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

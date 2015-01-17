//
//  ViewController.m
//  1.26. Constructing and Displaying Styled Texts
//
//  Created by marat on 15/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label = [[UILabel alloc] init];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.attributedText = [self attributedText];
    [self.label sizeToFit];
    self.label.center = self.view.center;
    [self.view addSubview:self.label];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSAttributedString *) attributedText{
    NSString *string = @"iOS SDK";
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]
                                         initWithString:string];
    NSDictionary *attributesForFirstWord = @{
                                             NSFontAttributeName : [UIFont boldSystemFontOfSize:60.0f],
                                             NSForegroundColorAttributeName : [UIColor redColor],
                                             NSBackgroundColorAttributeName : [UIColor blackColor]
                                             };
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(4.0f, 4.0f);
    NSDictionary *attributesForSecondWord = @{
                                              NSFontAttributeName : [UIFont boldSystemFontOfSize:60.0f],
                                              NSForegroundColorAttributeName : [UIColor whiteColor],
                                              NSBackgroundColorAttributeName : [UIColor redColor],
                                              NSShadowAttributeName : shadow
                                              };
    /* Find the string "iOS" in the whole string and sets its attribute */
    [result setAttributes:attributesForFirstWord
                    range:[string rangeOfString:@"iOS"]];
    /* Do the same thing for the string "SDK" */
    [result setAttributes:attributesForSecondWord
                    range:[string rangeOfString:@"SDK"]];
    return [[NSAttributedString alloc] initWithAttributedString:result]; }
@end

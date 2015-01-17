//
//  ViewController.h
//  1.10
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIActivityViewController *activityViewController;
@end

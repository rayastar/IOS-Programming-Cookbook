//
//  PopoverContentViewController.m
//  example
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "PopoverContentViewController.h"

@interface PopoverContentViewController ()
@property (nonatomic, strong) UIButton *buttonPhoto;
@property (nonatomic, strong) UIButton *buttonAudio;
@end

@implementation PopoverContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(200.0f, 125.0f);
    CGRect buttonRect = CGRectMake(20.0f,
                                   20.0f,
                                   160.0f,
                                   37.0f);
    self.buttonPhoto = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonPhoto setTitle:@"Photo"
                      forState:UIControlStateNormal];
    [self.buttonPhoto addTarget:self
                         action:@selector(gotoAppleWebsite:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonPhoto.frame = buttonRect;
    [self.view addSubview:self.buttonPhoto];
    buttonRect.origin.y += 50.0f;
    self.buttonAudio = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonAudio setTitle:@"Audio"
                      forState:UIControlStateNormal];
    [self.buttonAudio addTarget:self action:@selector(gotoAppleStoreWebsite:)
               forControlEvents:UIControlEventTouchUpInside];
    self.buttonAudio.frame = buttonRect;
    [self.view addSubview:self.buttonAudio];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) isInPopover{
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    if (popoverClass != nil &&
        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.myPopoverController != nil){
        return YES;
    }else{ return NO;
    } }
- (void) gotoAppleWebsite:(id)paramSender{
    if ([self isInPopover]){
        /* Go to website and then dismiss popover */ [self.myPopoverController dismissPopoverAnimated:YES];
    }else{
        /* Handle case for iPhone */
    } }
- (void) gotoAppleStoreWebsite:(id)paramSender{
    if ([self isInPopover]){
        /* Go to website and then dismiss popover */ [self.myPopoverController dismissPopoverAnimated:YES];
    }else{
        /* Handle case for iPhone */
    } }

- (NSString *) photoButtonTitle{ return @"Photo";
}
- (NSString *) audioButtonTitle{ return @"Audio";
}
- (void) alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self photoButtonTitle]]){ /* Adding a photo ... */
    }
    else if ([buttonTitle isEqualToString:[self audioButtonTitle]]){
        /* Adding an audio... */
    } }
-
}
@end

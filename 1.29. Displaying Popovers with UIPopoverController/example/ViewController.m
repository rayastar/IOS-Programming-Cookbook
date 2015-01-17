//
//  ViewController.m
//  example
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"
#import "PopoverContentViewController.h"
@interface ViewController () <UIAlertViewDelegate>
@property (nonatomic, strong) UIPopoverController *myPopoverController;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /* See if this class exists on the iOS running the app */
    Class popoverClass = NSClassFromString(@"UIPopoverController"); if (popoverClass != nil &&
                                                                        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        PopoverContentViewController *content =
        [[PopoverContentViewController alloc] initWithNibName:nil
                                                       bundle:nil];
        self.myPopoverController = [[UIPopoverController alloc]
                                    initWithContentViewController:content];
        content.myPopoverController = self.myPopoverController;
        self.barButtonAdd =
        [[UIBarButtonItem alloc]
         initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithPopover:)];
    }else{
        self.barButtonAdd =
        [[UIBarButtonItem alloc]
         initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithAlertView:)];
    }
    [self.navigationItem setRightBarButtonItem:self.barButtonAdd
                                      animated:NO];
}
	


- (void) performAddWithPopover:(id)paramSender{
    [self.myPopoverController
     presentPopoverFromBarButtonItem:self.barButtonAdd
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) performAddWithAlertView:(id)paramSender{
    
    [[[UIAlertView alloc] initWithTitle:nil
                                message:@"Add..."
                               delegate:self
                      cancelButtonTitle:@"Cancel"
                      otherButtonTitles:
      [self photoButtonTitle],
      [self audioButtonTitle], nil] show];
}
- (void) performAddWithPopover:(id)paramSender{
    [self.myPopoverController
     presentPopoverFromBarButtonItem:self.barButtonAdd
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
@end

//
//  FirstViewController.m
//  1.12
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"First";
        self.tabBarItem.image = [UIImage imageNamed:@"FirstTab"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.12
    self.title = @"First Controller";
    self.displaySecondViewController = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    [self.displaySecondViewController
     setTitle:@"Display Second View Controller"
     forState:UIControlStateNormal];
    [self.displaySecondViewController sizeToFit];
    self.displaySecondViewController.center = self.view.center;
    [self.displaySecondViewController
     addTarget:self action:@selector(performDisplaySecondViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displaySecondViewController];
    
    
    //1.15
    // добавление кнопки-надпись
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(performAdd:)];
    
    //Системная кнопка +
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
     target:self
     action:@selector(performAdd:)];
    
    //cwitch
    UISwitch *simpleSwitch = [[UISwitch alloc] init];
    simpleSwitch.on = YES;
    [simpleSwitch addTarget:self
                     action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:simpleSwitch];
    
    
    //стрелки
    NSArray *items = @[
                       @"Up",
                       @"Down"
                       ];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
                                            initWithItems:items];
    segmentedControl.momentary = YES;
    [segmentedControl addTarget:self
                         action:@selector(segmentedControlTapped:)
               forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    
    
//    UIBarButtonItem *rightBarButton =
//    [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
//    [self.navigationItem setRightBarButtonItem:rightBarButton
//                                      animated:YES];
    
}

- (void) segmentedControlTapped:(UISegmentedControl *)paramSender
{
    switch (paramSender.selectedSegmentIndex)
    { case 0:
        {
            NSLog(@"Up");
            break;
        }
        case 1:{
            NSLog(@"Down");
            break;
        }
    }
}

- (void)performAdd:(id)paramSender
{
    NSLog(@"Action method got called.");
}

- (void)switchIsChanged:(id)paramSender
{
    NSLog(@"Action method switch got called.");
}

//


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//1.12
- (void) performDisplaySecondViewController:(id)paramSender{
    SecondViewController *secondController = [[SecondViewController alloc]
                                              
                                              initWithNibName:nil
                                              bundle:NULL];
    [self.navigationController pushViewController:secondController
                                         animated:YES];
}
@end

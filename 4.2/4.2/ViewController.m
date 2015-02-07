//
//  ViewController.m
//  4.1. Populating a Table View with Data
//
//  Created by marat on 18/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

static NSString *MyCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView = [[UITableView alloc]
                        initWithFrame:self.view.bounds
                        style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:MyCellIdentifier];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    self.myTableView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:self.myTableView]){ return 3;
    }
    return 0;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* result = nil;
    if ([tableView isEqual:self.myTableView]){
        result = [tableView
                  dequeueReusableCellWithIdentifier:MyCellIdentifier
                  forIndexPath:indexPath];
        result.textLabel.text =
        [NSString stringWithFormat:@"Section %ld, Cell %ld",
         (long)indexPath.section, (long)indexPath.row];
        result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return result;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    /* Do something when the accessory button is tapped */
    NSLog(@"cell at index path = %@", indexPath);
    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
}

@end

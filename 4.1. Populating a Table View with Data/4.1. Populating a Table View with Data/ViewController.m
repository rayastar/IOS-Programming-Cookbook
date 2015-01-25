//
//  ViewController.m
//  4.1. Populating a Table View with Data
//
//  Created by marat on 18/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

static NSString *TableViewCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView =
    [[UITableView alloc] initWithFrame:self.view.bounds
                                 style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:TableViewCellIdentifier];
   
    self.myTableView.dataSource = self;
    /* Make sure our table view resizes correctly */
    self.myTableView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:self.myTableView]){
        return 3;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.myTableView]){
        switch (section){
            case 0:{ return 3;
                break; }
            case 1:{ return 5;
                break; }
            case 2:{ return 8;
                break; }
        } }
    return 0; }

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if ([tableView isEqual:self.myTableView]){
        cell = [tableView
                dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:
                               @"Section %ld, Cell %ld",
                               (long)indexPath.section, (long)indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
   // [button addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:
     //UIControlEventTouchUpInside];
    cell.accessoryView = button;
    return cell;
}


//- (void)checkButtonTapped:(id)sender event:(id)event{
//    NSSet *touches = [event allTouches];
//    UITouch *touch = [touches anyObject];
//    CGPoint currentTouchPosition = [touch locationInView:self.myTableView];
//    NSIndexPath *indexPath = [self.myTableView indexPathForRowAtPoint: currentTouchPosition];
//    if (indexPath != nil){
//        [selfmyTableView: self.myTableView accessoryButtonTappedForRowWithIndexPath: indexPath];
//    }
//}


//- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    /* Do something when the accessory button is tapped */
//    NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
//    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
//}



@end

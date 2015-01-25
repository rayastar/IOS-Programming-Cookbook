//
//  ViewController.m
//  4.1. Populating a Table View with Data
//
//  Created by marat on 18/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

static NSString *MyCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView =
    [[UITableView alloc] initWithFrame:self.view.bounds
                                 style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:MyCellIdentifier];
    self.myTableView.dataSource = self;
    /* Make sure our table view resizes correctly */
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.myTableView]){ switch (section){
        case 0:{ return 3;
            break; }
        case 1:{ return 5;
            break; }
        case 2:{ return 8;
            break; }
    } }
    return 0; }

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier
                                           forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld", (long)indexPath.section,
                           (long)indexPath.row];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
    [button setTitle:@"Expand"
            forState:UIControlStateNormal];
    [button addTarget:self action:@selector(performExpand:)
     forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = button;
    return cell;
}

//- (void) performExpand:(UIButton *)paramSender{
//}
/* Handle the tap event of the button */


- (UIView *) superviewOfType:(Class)paramSuperviewClass forView:(UIView *)paramView
{
    if (paramView.superview != nil)
    {
        if ([paramView.superview isKindOfClass:paramSuperviewClass])
        {
            return paramView.superview;
        }
        else
        {
                return [self superviewOfType:paramSuperviewClass forView:paramView.superview];
            }
    }
    return nil;
}


- (void) performExpand:(UIButton *)paramSender{
    /* Handle the tap event of the button */
    __unused UITableViewCell *parentCell =
    (UITableViewCell *)[self superviewOfType:[UITableViewCell class]
                                     forView:paramSender]; /* Now do something with the cell if you want to */
}
@end

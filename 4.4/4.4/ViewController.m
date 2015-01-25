//
//  ViewController.m
//  4.1. Populating a Table View with Data
//
//  Created by marat on 18/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

static NSString *TableViewCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *myArray;
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
	// Do any additional setup after loading the view, typically from a nib.
    self.myArray = [[NSMutableArray alloc] initWithObjects:@"hello", @"hi",@"hello", @"hi",@"hello", @"hi",@"hello", @"hi",@"hello", @"hi", nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if ([tableView isEqual:self.myTableView]){
//        return 3;
//    }
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if ([tableView isEqual:self.myTableView]){ switch (section){
//        case 0:{ return 3;
//            break; }
//        case 1:{ return 5;
//            break; }
//        case 2:{ return 8;
//            break; }
//    }
//    }
    return [self.myArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if ([tableView isEqual:self.myTableView]){
        cell = [tableView
                dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                forIndexPath:indexPath];
//        cell.textLabel.text = [NSString stringWithFormat:
//                               @"Section %ld, Cell %ld",
//                               (long)indexPath.section, (long)indexPath.row];
        cell.textLabel.text = self.myArray[indexPath.row];
    }
    return cell; }


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert;
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing
             animated:animated];
    [self.myTableView setEditing:editing
                        animated:animated];
}


- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        /* First remove this object from the source */
        [self.myArray removeObjectAtIndex:indexPath.row];
        /* Then remove the associated cell from the Table View */
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
    }
}
@end

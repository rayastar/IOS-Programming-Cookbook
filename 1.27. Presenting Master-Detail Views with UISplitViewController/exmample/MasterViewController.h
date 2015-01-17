//
//  MasterViewController.h
//  exmample
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

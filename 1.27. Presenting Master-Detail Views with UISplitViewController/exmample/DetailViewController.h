//
//  DetailViewController.h
//  exmample
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

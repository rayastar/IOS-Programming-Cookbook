//
//  ViewController.h
//  1.4
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *secondPicker;
@property (nonatomic,copy) NSArray *myarray;
@property (nonatomic) NSInteger row;
@end

//
//  ViewController.m
//  1.4
//
//  Created by marat on 06/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *secondPicker;
@property (nonatomic,copy) NSArray *myarray;
@property (nonatomic) NSInteger row;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myPicker = [[UIPickerView alloc] init];
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;
    self.myPicker.center = self.view.center;
    self.myPicker.showsSelectionIndicator = YES;
    [self.view addSubview:self.myPicker];
    
    self.myarray = [[NSArray alloc] initWithObjects:@"hello",@"how",@"are",@"you", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:self.myPicker])
    {
        return 1;
    }
    return 0;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.myPicker])
    {
        return [self.myarray count];
    }
    return 0;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if ([pickerView isEqual:self.myPicker])
    {
        return [NSString stringWithFormat:@"%@",self.myarray[row]];
        
    }
    return nil;
}

//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
//{
//    NSLog(@"yes");
//}

@end

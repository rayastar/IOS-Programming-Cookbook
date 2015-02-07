//
//  MySegue.m
//  6.4. Introducing Custom Segue Transitions to Your Storyboard
//
//  Created by marat on 05/02/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "MySegue.h"

@implementation MySegue
- (void) perform{
    
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    [UIView transitionFromView:source.view
                        toView:destination.view
                      duration:0.50f
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    completion:^(BOOL finished) {
                        NSLog(@"Transitioning is finished");
                    }];
}
@end

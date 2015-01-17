//
//  GravityViewController.m
//  2.2. Detecting and Reacting to Collisions Between UI Components
//
//  Created by marat on 17/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "GravityViewController.h"

NSString *const kBottomBoundary = @"bottomBoundary";

@interface GravityViewController () <UICollisionBehaviorDelegate>
@property (nonatomic, strong) NSMutableArray *squareViews;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation GravityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{ [super viewDidAppear:animated];
//    /* Create the views */
//    NSUInteger const NumberOfViews = 2;
//    self.squareViews = [[NSMutableArray alloc] initWithCapacity:NumberOfViews];
//    NSArray *colors = @[[UIColor redColor], [UIColor greenColor]];
//    CGPoint currentCenterPoint = self.view.center;
//    CGSize eachViewSize = CGSizeMake(50.0f, 50.0f);
//    for (NSUInteger counter = 0; counter < NumberOfViews; counter++){
//        UIView *newView =
//        [[UIView alloc] initWithFrame:
//         CGRectMake(0.0f, 0.0f, eachViewSize.width, eachViewSize.height)];
//        newView.backgroundColor = colors[counter];
//        newView.center = currentCenterPoint;
//        currentCenterPoint.y += eachViewSize.height + 10.0f;
//        [self.view addSubview:newView];
//        [self.squareViews addObject:newView];
//    }
//    self.animator = [[UIDynamicAnimator alloc]
//                     initWithReferenceView:self.view];
//    /* Create gravity */
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
//                                  initWithItems:self.squareViews];
//    [self.animator addBehavior:gravity];
//    /* Create collision detection */
//    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
//                                      initWithItems:self.squareViews];
//    collision.translatesReferenceBoundsIntoBoundary = YES;
//    [self.animator addBehavior:collision];
    
    /* Create the views */
    NSUInteger const NumberOfViews = 2;
    self.squareViews = [[NSMutableArray alloc] initWithCapacity:NumberOfViews];
    NSArray *colors = @[[UIColor redColor], [UIColor greenColor]];
    CGPoint currentCenterPoint = CGPointMake(self.view.center.x, 0.0f); CGSize eachViewSize = CGSizeMake(50.0f, 50.0f);
    for (NSUInteger counter = 0; counter < NumberOfViews; counter++){
        UIView *newView =
        [[UIView alloc] initWithFrame:
         CGRectMake(0.0f, 0.0f, eachViewSize.width, eachViewSize.height)];
        newView.backgroundColor = colors[counter];
        newView.center = currentCenterPoint;
        currentCenterPoint.y += eachViewSize.height + 10.0f;
        [self.view addSubview:newView];
        [self.squareViews addObject:newView];
    }
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    /* Create gravity */
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
                                  initWithItems:self.squareViews];
    [self.animator addBehavior:gravity];
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                      initWithItems:self.squareViews];
    [collision
     addBoundaryWithIdentifier:kBottomBoundary
     fromPoint:CGPointMake(0.0f, self.view.bounds.size.height - 100.0f)
     toPoint:CGPointMake(self.view.bounds.size.width,
                         self.view.bounds.size.height - 100.0f)];
    collision.collisionDelegate = self;
    [self.animator addBehavior:collision];
}



- (void)collisionBehavior:(UICollisionBehavior*)paramBehavior beganContactForItem:(id <UIDynamicItem>)paramItem
   withBoundaryIdentifier:(id <NSCopying>)paramIdentifier atPoint:(CGPoint)paramPoint{
    NSString *identifier = (NSString *)paramIdentifier;
    if ([identifier isEqualToString:kBottomBoundary]){
        [UIView animateWithDuration:1.0f animations:^{
            UIView *view = (UIView *)paramItem;
            view.backgroundColor = [UIColor redColor];
            view.alpha = 0.0f;
            view.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        } completion:^(BOOL finished) {
            UIView *view = (UIView *)paramItem; [paramBehavior removeItem:paramItem]; [view removeFromSuperview];
        }]; }
}
@end

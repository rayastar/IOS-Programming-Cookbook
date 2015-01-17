//
//  ViewController.m
//  1.23 UIScrollView
//
//  Created by marat on 15/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *myScrollView; @property (nonatomic, strong) UIImageView *myImageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.myScrollView addSubview:self.myImageView];
//    self.myScrollView.contentSize = self.myImageView.bounds.size;
//    self.myScrollView.delegate = self;
//    [self.view addSubview:self.myScrollView];
    UIImage *iPhone = [UIImage imageNamed:@"iPhone"];
    UIImage *iPad = [UIImage imageNamed:@"iPad"];
    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
    CGRect scrollViewRect = self.view.bounds;
    self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0f,
                                               scrollViewRect.size.height);
    [self.view addSubview:self.myScrollView];
    CGRect imageViewRect = self.view.bounds;
    UIImageView *iPhoneImageView = [self newImageViewWithImage:iPhone
                                                         frame:imageViewRect];
    [self.myScrollView addSubview:iPhoneImageView];
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *iPadImageView = [self newImageViewWithImage:iPad
                                                       frame:imageViewRect];
    [self.myScrollView addSubview:iPadImageView];
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *macBookAirImageView =
    [self newImageViewWithImage:macBookAir
                          frame:imageViewRect];
    [self.myScrollView addSubview:macBookAirImageView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /* Gets called when user scrolls or drags */ self.myScrollView.alpha = 0.50f;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    /* Gets called only after scrolling */ self.myScrollView.alpha = 1.0f;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    /* Make sure the alpha is reset even if the user is dragging */
    self.myScrollView.alpha = 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImageView *) newImageViewWithImage:(UIImage *)paramImage frame:(CGRect)paramFrame{
    UIImageView *result = [[UIImageView alloc] initWithFrame:paramFrame]; result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = paramImage;
    return result;
}
@end

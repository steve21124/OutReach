//
//  ORBaseViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORBaseViewController.h"

@interface ORBaseViewController ()

@end

@implementation ORBaseViewController

- (void)viewDidLoad
{
   [super viewDidLoad];

   if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
      // iOS 7
      [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
   else
      // iOS 6
      [[UIApplication sharedApplication] setStatusBarHidden:YES
                                              withAnimation:UIStatusBarAnimationSlide];
}

- (BOOL)prefersStatusBarHidden
{
   return YES;
}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

@end

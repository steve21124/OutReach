//
//  ORBaseViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORBaseViewController.h"

@implementation ORBaseViewController

- (void)viewDidLoad
{
   [super viewDidLoad];

   // Hides the status bar at the top of the screen
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

@end

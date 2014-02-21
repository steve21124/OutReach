//
//  ORNavigationMenu.m
//  OutReach
//
//  Created by Gregory Klein on 2/20/14.
//  Copyright (c) 2014 Pure Virtual Studios. All rights reserved.
//

#import "ORNavigationMenu.h"

ORNavigationMenu *s_sharedNavigationMenu = nil;

@implementation ORNavigationMenu

+ (ORNavigationMenu *)sharedMenu
{
   if (s_sharedNavigationMenu == nil)
   {
      NSArray *images = @[[UIImage imageNamed:@"user"],
                          [UIImage imageNamed:@"globe"],
                          [UIImage imageNamed:@"search"],
                          [UIImage imageNamed:@"list"]];

      NSArray *colors = @[[UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                          [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                          [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                          [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1]];

      s_sharedNavigationMenu = [[ORNavigationMenu alloc] initWithImages:images
                                                        selectedIndices:[NSMutableIndexSet indexSetWithIndex:0]
                                                           borderColors:colors];
      s_sharedNavigationMenu.isSingleSelect = YES;
      s_sharedNavigationMenu.itemSize = CGSizeMake(50, 50);
      s_sharedNavigationMenu.width = 120.f;
   }
   return s_sharedNavigationMenu;
}

@end

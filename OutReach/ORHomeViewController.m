//
//  ORHomeViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORHomeViewController.h"
#import "RNFrostedSidebar.h"
#import <Parse/Parse.h>

@interface ORHomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@end

@implementation ORHomeViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
   PFUser *currentUser = [PFUser currentUser];
   if (!currentUser)
   {
      [self performSegueWithIdentifier:@"showLogin" sender:self];
   }

   self.usernameLabel.text = currentUser.username;
   [super viewWillAppear:animated];
}

- (IBAction)logout:(id)sender
{
   [PFUser logOut];
   [self performSegueWithIdentifier:@"showLogin" sender:self];
}

#pragma mark - IBActions
- (IBAction)showMenu:(id)sender
{
   NSArray *images = @[[UIImage imageNamed:@"user"],
                       [UIImage imageNamed:@"globe"],
                       [UIImage imageNamed:@"search"],
                       [UIImage imageNamed:@"list"]];

   NSArray *colors = @[[UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                       [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                       [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1]];

   RNFrostedSidebar *frostedSidebar = [[RNFrostedSidebar alloc] initWithImages:images
                                                               selectedIndices:[NSMutableIndexSet indexSetWithIndex:0]
                                                                  borderColors:colors];
   frostedSidebar.isSingleSelect = YES;
   frostedSidebar.itemSize = CGSizeMake(50, 50);
   frostedSidebar.width = 120.f;
   [frostedSidebar show];
}


@end

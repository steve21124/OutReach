//
//  ORHomeViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORHomeViewController.h"
#import "ORNavigationMenu.h"
#import <Parse/Parse.h>

@interface ORHomeViewController () <RNFrostedSidebarDelegate>
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
   [[ORNavigationMenu sharedMenu] show];
}

#pragma mark - RNFrostedSidebar Delegate Methods
- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index
{
   
}

@end

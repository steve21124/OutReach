//
//  ORHomeViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORHomeViewController.h"
#import <Parse/Parse.h>

@implementation ORHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
   PFUser *currentUser = [PFUser currentUser];
   if (!currentUser)
      [self performSegueWithIdentifier:@"showLogin" sender:self];

   _usernameLabel.text = currentUser.username;

   [super viewWillAppear:animated];
}

- (IBAction)logout:(id)sender
{
   [PFUser logOut];
   [self performSegueWithIdentifier:@"showLogin"
                             sender:self];
}

@end

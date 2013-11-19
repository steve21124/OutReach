//
//  ORSignUpViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORSignUpViewController.h"
#import <Parse/Parse.h>

@implementation ORSignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
   self.navigationController.navigationBarHidden = YES;
   [super viewWillAppear:animated];
}

- (IBAction)signUp:(id)sender
{
   NSString *firstName =
      [_firstName.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *lastName =
      [_lastName.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *password =
      [_password.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *email =
      [_emailAddress.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];

   if (!firstName.length || !lastName.length || !password.length || !email.length)
   {
      NSString *message = @"Make sure you enter your first name, last name, email address and password.";
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"OutReach Alert:"
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
      [alertView show];
   }
   else
   {
      PFUser *newUser = [PFUser user];
      newUser.username = email;
      newUser.email = email;
      newUser.password = password;

      [newUser signUpInBackgroundWithBlock:
       ^(BOOL succeeded, NSError *error) {
          if (error) {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                 message:[[error userInfo] objectForKey:@"error"]
                                                                delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil];
             [alertView show];
          }
          else {
             [self.navigationController popToRootViewControllerAnimated:YES];
          }
       }];
   }
}

- (IBAction)returnToLogin:(id)sender
{
   [self.navigationController popViewControllerAnimated:YES];
}

@end

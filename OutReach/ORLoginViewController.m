//
//  ORLoginViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORLoginViewController.h"
#import <Parse/Parse.h>

@implementation ORLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
   self.navigationController.navigationBarHidden = YES;
   [super viewWillAppear:animated];
}

- (IBAction)login:(id)sender
{
   NSString *email = [_emailTextField.text
                         stringByTrimmingCharactersInSet:[NSCharacterSet
                                                          whitespaceAndNewlineCharacterSet]];
   NSString *password = [_passwordTextField.text
                         stringByTrimmingCharactersInSet:[NSCharacterSet
                                                          whitespaceAndNewlineCharacterSet]];

   if (!email.length || !password.length)
   {
      NSString *message = @"Make sure you enter a username and password.";
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"OutReach Alert:"
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
      [alertView show];
   }
   else
   {
      [PFUser logInWithUsernameInBackground:email
                                   password:password
                                      block:
       ^(PFUser *user, NSError *error) {
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
@end

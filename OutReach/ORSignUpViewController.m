//
//  ORSignUpViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORSignUpViewController.h"

@interface ORSignUpViewController ()

@end

@implementation ORSignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
      NSString *message = @"Make sure you enter a username, password, and email address.";
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"OutReach Alert:"
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
      [alertView show];
   }
}

- (IBAction)returnToLogin:(id)sender
{
   [self.navigationController popViewControllerAnimated:YES];
}

@end

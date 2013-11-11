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

- (IBAction)loginButtonPressed:(id)sender
{
   [self.navigationController popViewControllerAnimated:YES];
}

@end

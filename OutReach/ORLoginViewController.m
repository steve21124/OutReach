//
//  ORLoginViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORLoginViewController.h"

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
   NSLog(@"attempting to log in");
}
@end

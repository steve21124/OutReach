//
//  ORSignUpViewController.h
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORBaseViewController.h"

@interface ORSignUpViewController : ORBaseViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)signUp:(id)sender;
- (IBAction)returnToLogin:(id)sender;

@end

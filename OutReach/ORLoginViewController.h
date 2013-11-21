//
//  ORLoginViewController.h
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORBaseViewController.h"

@class TPKeyboardAvoidingScrollView;

@interface ORLoginViewController : ORBaseViewController

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIButton *toggleCredentialsButton;

- (IBAction)loginOrSignUp:(id)sender;
- (IBAction)toggleCredentials:(id)sender;

@end

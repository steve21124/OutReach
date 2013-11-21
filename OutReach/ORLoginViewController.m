//
//  ORLoginViewController.m
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import "ORLoginViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "UIColor+Crayola.h"
#import <Parse/Parse.h>

typedef NS_ENUM(NSInteger, ORCredentialsState) {
   OR_LOGIN,
   OR_SIGNUP
};

@interface ORLoginViewController()
{
   ORCredentialsState _credentialsState;

   UITextField *_firstNameTextField;
   UITextField *_lastNameTextField;
   CGRect _defaultFirstNameFrame;
   CGRect _defaultLastNameFrame;

   UIDynamicAnimator *_dynamicAnimator;
}
@end

@implementation ORLoginViewController

- (void)setupTextFields
{
   _defaultFirstNameFrame = CGRectMake(_emailTextField.bounds.origin.x,
                                       -CGRectGetHeight(_emailTextField.frame) * 2,
                                       CGRectGetWidth(_emailTextField.frame),
                                       CGRectGetHeight(_emailTextField.frame));

   _defaultLastNameFrame = CGRectMake(_emailTextField.bounds.origin.x,
                                      -CGRectGetHeight(_emailTextField.frame),
                                      CGRectGetWidth(_emailTextField.frame),
                                      CGRectGetHeight(_emailTextField.frame));

   _firstNameTextField = [[UITextField alloc] initWithFrame:_defaultFirstNameFrame];
   _firstNameTextField.font = [UIFont systemFontOfSize:14];
   _firstNameTextField.placeholder = @"First Name";
   _firstNameTextField.borderStyle = _emailTextField.borderStyle;

   _lastNameTextField = [[UITextField alloc] initWithFrame:_defaultLastNameFrame];
   _lastNameTextField.font = [UIFont systemFontOfSize:14];
   _lastNameTextField.placeholder = @"Last Name";
   _lastNameTextField.borderStyle = _emailTextField.borderStyle;

   _firstNameTextField.backgroundColor = [UIColor crayolaCaribbeanGreenPearlColor];
   _lastNameTextField.backgroundColor = [UIColor crayolaCaribbeanGreenPearlColor];
   _emailTextField.backgroundColor = [UIColor crayolaCaribbeanGreenPearlColor];
   _passwordTextField.backgroundColor = [UIColor crayolaCaribbeanGreenPearlColor];

   [_scrollView addSubview:_firstNameTextField];
   [_scrollView addSubview:_lastNameTextField];
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   [self setupTextFields];

   _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:_scrollView];
   _credentialsState = OR_LOGIN;
}

- (void)viewWillAppear:(BOOL)animated
{
   self.navigationController.navigationBarHidden = YES;
   [super viewWillAppear:animated];
}

- (IBAction)loginOrSignUp:(id)sender
{
   switch (_credentialsState)
   {
      case OR_LOGIN:
         [self login];
         break;

      case OR_SIGNUP:
         [self signUp];
      default:
         break;
   }
}

- (void)login
{
   NSString *email = [_emailTextField.text
                      stringByTrimmingCharactersInSet:[NSCharacterSet
                                                       whitespaceAndNewlineCharacterSet]];
   NSString *password = [_passwordTextField.text
                         stringByTrimmingCharactersInSet:[NSCharacterSet
                                                          whitespaceAndNewlineCharacterSet]];
   if (!email.length || !password.length)
   {
      NSString *message = @"Make sure you enter an email address and password.";
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
          if (error)
          {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                 message:[[error userInfo] objectForKey:@"error"]
                                                                delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil];
             [alertView show];
          }
          else
          {
             [self.navigationController popToRootViewControllerAnimated:YES];
          }
       }];
   }
}

- (void)signUp
{
   NSString *firstName =
      [_firstNameTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *lastName =
      [_lastNameTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *password =
      [_passwordTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
   NSString *email =
      [_emailTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];

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

- (IBAction)toggleCredentials:(id)sender
{
   [self toggleCredentialsState];
}

#pragma mark Helper Methods
- (void)toggleCredentialsState
{
   switch (_credentialsState)
   {
      case OR_LOGIN:
         [self addFirstAndLastNameTextFieldsToView];
         _actionButton.titleLabel.text = @"Sign Up";
         _bottomLabel.text = @"Already have an account?";
         _toggleCredentialsButton.titleLabel.text = @"  Log In.  ";
         _credentialsState = OR_SIGNUP;
         return;
      case OR_SIGNUP:
         [self removeFirstAndLastNameTextFields];
         _actionButton.titleLabel.text = @"  Log In  ";
         _bottomLabel.text = @"Don't have an account?";
         _toggleCredentialsButton.titleLabel.text = @"Sign Up.";
         _credentialsState = OR_LOGIN;
         return;
      default:
         NSLog(@"Current ORCredentialsState %d not supported.", _credentialsState);
         return;
   }
}

- (void)removeFirstAndLastNameTextFields
{
   [_dynamicAnimator removeAllBehaviors];

   UICollisionBehavior *collideWithBounds =
      [[UICollisionBehavior alloc] initWithItems:@[_firstNameTextField, _lastNameTextField]];

   UIEdgeInsets insets = UIEdgeInsetsMake(-CGRectGetHeight(_emailTextField.frame)*2, -50, -50, 0);
   [collideWithBounds setTranslatesReferenceBoundsIntoBoundaryWithInsets:insets];

   UIGravityBehavior *gravityBehavoir =
      [[UIGravityBehavior alloc] initWithItems:@[_lastNameTextField, _firstNameTextField]];
   gravityBehavoir.gravityDirection = CGVectorMake(0.0, -1.0);
   gravityBehavoir.magnitude = 3.0;

   UIDynamicItemBehavior *itemBehavior =
   [[UIDynamicItemBehavior alloc] initWithItems:@[_firstNameTextField, _lastNameTextField]];

   [itemBehavior addAngularVelocity:-M_PI_2
                             forItem:_firstNameTextField];

   [itemBehavior addAngularVelocity:-M_PI_2
                            forItem:_lastNameTextField];

   [_dynamicAnimator addBehavior:itemBehavior];
   [_dynamicAnimator addBehavior:collideWithBounds];
   [_dynamicAnimator addBehavior:gravityBehavoir];

   _firstNameTextField.frame = _defaultFirstNameFrame;
   _lastNameTextField.frame = _defaultLastNameFrame;
}

- (void)addFirstAndLastNameTextFieldsToView
{
   [_dynamicAnimator removeAllBehaviors];

   float lastNameSnapY = CGRectGetMinY(_emailTextField.frame) -
                         CGRectGetHeight(_emailTextField.frame)/2.0 - 8;

   float firstNameSnapY = lastNameSnapY - CGRectGetHeight(_emailTextField.frame) - 8;

   CGPoint lastNameSnapPoint = CGPointMake(CGRectGetMinX(_emailTextField.frame) +
                                           CGRectGetWidth(_emailTextField.frame)/2.0,
                                           lastNameSnapY);

   CGPoint firstNameSnapPoint = CGPointMake(CGRectGetMinX(_emailTextField.frame) +
                                            CGRectGetWidth(_emailTextField.frame)/2.0,
                                            firstNameSnapY);

   UISnapBehavior *lastNameSnapBehavior = [[UISnapBehavior alloc] initWithItem:_lastNameTextField
                                                                   snapToPoint:lastNameSnapPoint];
   lastNameSnapBehavior.damping = .5;

   UISnapBehavior *firstNameSnapBehavior = [[UISnapBehavior alloc] initWithItem:_firstNameTextField
                                                                    snapToPoint:firstNameSnapPoint];
   firstNameSnapBehavior.damping = .5;
   
   [_dynamicAnimator addBehavior:firstNameSnapBehavior];
   [_dynamicAnimator addBehavior:lastNameSnapBehavior];
}
@end

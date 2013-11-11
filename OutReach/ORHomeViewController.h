//
//  ORHomeViewController.h
//  OutReach
//
//  Created by Gregory Klein on 11/10/13.
//  Copyright (c) 2013 Pure Virtual Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORBaseViewController.h"

@interface ORHomeViewController : ORBaseViewController

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

- (IBAction)logout:(id)sender;

@end

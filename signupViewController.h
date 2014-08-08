//
//  signupViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/8/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface signupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
- (IBAction)signUpAction:(id)sender;
@end

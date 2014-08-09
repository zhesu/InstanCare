//
//  LoginViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/7/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
- (IBAction)signin:(id)sender;

- (IBAction)backgroundClick:(id)sender;


@end

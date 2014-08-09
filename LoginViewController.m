//
//  LoginViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/7/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    PFUser *user = [PFUser currentUser];
    if (user.username !=nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signin:(id)sender {
    [self checkFieldsComplete];
}

- (IBAction)backgroundClick:(id)sender {
    [_emailfield resignFirstResponder];
    [_passwordfield resignFirstResponder];
}

- (IBAction)signup:(id)sender {
   // [self checkFieldsComplete];
}
- (void) checkFieldsComplete {
    if ([_emailfield.text isEqualToString:@""] || [_passwordfield.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Oooopss!" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [PFUser logInWithUsernameInBackground:_emailfield.text password:_passwordfield.text block:^(PFUser *user, NSError *error) {
            if (!error) {
                NSLog(@"Login user!");
                _emailfield.text = nil;
                _passwordfield.text = nil;
                [self performSegueWithIdentifier:@"login" sender:self];
            }
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ooops!" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}

@end

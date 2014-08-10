//
//  signupViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/8/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "signupViewController.h"

@interface signupViewController ()

@end

@implementation signupViewController

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)backgroudClick:(id)sender {
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    [_firstName resignFirstResponder];
    [_lastName resignFirstResponder];
    [_phoneNumber resignFirstResponder];
    [_dateOfBirth resignFirstResponder];
    [_primaryDoctor resignFirstResponder];
    [_gender resignFirstResponder];
    
}

- (IBAction)signUpAction:(id)sender {
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    [self checkFieldsComplete];
}

- (void) checkFieldsComplete {
    //if ([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""] || [_firstName.text isEqualToString:@""] || [_lastName.text isEqualToString:@""] || [_phoneNumber.text isEqualToString:@""] || [_dateOfBirth.text isEqualToString:@""] || [_gender.text isEqualToString:@""]) {
    if ([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Oooopss!" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
            [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Passwords don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self registerNewUser];
    }
}

- (void) registerNewUser {
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _emailField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    newUser[@"Firstname"] = _firstName.text;
    newUser[@"Lastname"] = _lastName.text;
    newUser[@"phone"] = _phoneNumber.text;
    newUser[@"Dateofbirth"] = _dateOfBirth.text;
    newUser[@"Primarydoctor"] = _primaryDoctor.text;
    newUser[@"gender"] = _gender.text;
 
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration success!");
            _emailField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            _firstName.text = nil;
            _lastName.text = nil;
            _phoneNumber.text = nil;
            _dateOfBirth.text = nil;
            _primaryDoctor.text = nil;
            _gender.text = nil;
           [self performSegueWithIdentifier:@"signup" sender:self];
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];
}

@end

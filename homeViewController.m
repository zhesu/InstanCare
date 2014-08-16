//
//  homeViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/15/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

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
    [self performSelector:@selector(queryParseMethod)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)queryParseMethod {
    // Create the data model
    
    //NSLog(@"start query");
    //PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    PFUser *user = [PFUser currentUser];
    NSLog(@"%@", user);
    PFFile *imageFile = [user objectForKey:@"profilePicture"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        //NSLog(@"%@", data);
        if (!error) {
            //NSLog(@"%@", data);
            _profileImage.image = [UIImage imageWithData:data];
            
        }
        
    }];

/*    PFQuery *query = [PFUser query];
   // [query whereKey:@"username" equalTo:@"zhesu@usc.edu"];
    //NSLog(@"%@", query);

    //PFFile *image1 = [query objectForKey:@"imageFile"];
    //NSLog(@"%@", image1);
    [query getObjectInBackgroundWithId:@"yepjBhRC61" block:^(PFObject *gameScore, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", gameScore);
        PFFile *imageFile = [gameScore objectForKey:@"profilePicture"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            //NSLog(@"%@", data);
            if (!error) {
                //NSLog(@"%@", data);
                _profileImage.image = [UIImage imageWithData:data];
                
            }
            
        }];
    }];
*/
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

@end

//
//  homeViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/15/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController () {
    CLLocationManager *manager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *preferredAddress;
}

@end

@implementation homeViewController
//@synthesize isSomethingEnabled;
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
    
    NSLog(@"isSomethingEnabled home");
    _isSomethingEnabled = (BOOL *)NO;
    NSLog(@"%s",_isSomethingEnabled);
    // Do any additional setup after loading the view.
    [self performSelector:@selector(queryParseMethod)];
    manager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [manager startUpdatingLocation];
    
    //[_addressButton setTitle:@"addressButton" forState:UIControlStateNormal];
    

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
    PFObject *tempAddress = [user objectForKey:@"preferredAddress"];
    [_addressButton setTitle:tempAddress forState:UIControlStateNormal];
    //NSLog(@"%@", user);
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

- (IBAction)buttonPress:(id)sender {
   // [_addressButton setTitle:@"addressButton" forState:UIControlStateNormal];

}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"Error: %@", error);
    NSLog(@"Failed to get location! :(");
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    //NSLog(@"Location: %@", newLocation);
    CLLocation *currentLocation = newLocation;
 //   float lat = newLocation.coordinate.latitude;
 //   float lng = newLocation.coordinate.longitude;
 
    if (currentLocation != nil) {
        
      //  self.latitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
      //  self.longitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        
    }
    //PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    //NSLog(@"%@", geoPoint);
/*    PFUser *user = [PFUser currentUser];
    NSLog(@"%@", user);
    NSLog(@"%@", preferredAddress);
    [[PFUser currentUser] setObject:[user objectForKey:@"preferredAddress"] forKey:preferredAddress]; 
 */
    //PFFile *imageFile = [user objectForKey:@"profilePicture"];

    /*PFObject *object = [PFObject objectWithClassName:@"tableView"];
    if (currentCity == NULL || currentAddress == NULL || currentZip == NULL) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Oooopss!" message:@"You entered an invalid address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        [object setObject:geoPoint forKey:@"location"];
        [object setObject:currentCity forKey:@"city"];
        [object setObject:currentAddress forKey:@"address"];
        [object setObject:currentZip forKey:@"zipcode"];
        
        [object saveEventually:^(BOOL succeeded, NSError *error) {
     
        }];
    }*/
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error == nil && [placemarks count] > 0) {
            
            placemark = [placemarks lastObject];
             NSString *tempaddress = [NSString stringWithFormat:@"%@ %@, %@ %@ %@",
                                 placemark.subThoroughfare, placemark.thoroughfare, placemark.locality,
                                 placemark.administrativeArea,                                 placemark.postalCode];
            preferredAddress = tempaddress;

            PFUser *user = [PFUser currentUser];
            [user setObject:preferredAddress forKey:@"preferredAddress"];
            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    //NSLog(@"user address saved");
                } else {
                    // There was an error saving the currentUser.
                }
            }];

        } else {
            
            NSLog(@"%@", error.debugDescription);
            
        }
        
    } ];
    
    
}
/*
#pragma mark - addressViewControllerDelegate

- (void)addressViewControllerDidCancel:(addressViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
*/
@end

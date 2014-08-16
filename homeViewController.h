//
//  homeViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/15/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>
//#import "MapViewController.h"
//#import "addressViewController.h"
//@interface homeViewController : UIViewController <CLLocationManagerDelegate, addressViewControllerDelegate> {
@interface homeViewController : UIViewController <CLLocationManagerDelegate> {

    CLLocationDegrees currentLatitude;
    CLLocationDegrees currentLongitude;
    NSString *currentAddress;
    NSString *currentCity;
    NSString *currentZip;
    //BOOL *isSomethingEnabled;

}
@property (weak, nonatomic) IBOutlet UIButton *addressButton;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) NSArray *imageFilesArray;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property(nonatomic) BOOL *isSomethingEnabled;

- (IBAction)buttonPress:(id)sender;

@end

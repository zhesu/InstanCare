//
//  MapViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/13/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
#import "homeViewController.h"

@interface MapViewController : UIViewController<GMSMapViewDelegate> {
    homeViewController *homeView;
    CLLocationDegrees currentLatitude;
    CLLocationDegrees currentLongitude;
    NSString *currentAddress;
    NSString *currentCity;
    NSString *currentZip;
    NSString *preferredAddress;
    BOOL flag;
}
@property (weak, nonatomic) IBOutlet UIView *subViewMap;
@property (weak, nonatomic) IBOutlet UIImageView *mapPin;

@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *aptNumber;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property(nonatomic) BOOL *isSomethingEnabled2;
- (IBAction)insertNewLocation:(id)sender;


@end

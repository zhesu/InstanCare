//
//  homeViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/15/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <GoogleMaps/GoogleMaps.h>

@interface homeViewController : UIViewController {
    CLLocationDegrees currentLatitude;
    CLLocationDegrees currentLongitude;
    NSString *currentAddress;
    NSString *currentCity;
    NSString *currentZip;
}
@property (weak, nonatomic) IBOutlet UIButton *addressButton;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) NSArray *imageFilesArray;
@property (strong, nonatomic) NSMutableArray *imageArray;

- (IBAction)buttonPress:(id)sender;

@end

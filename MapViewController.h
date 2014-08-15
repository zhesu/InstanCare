//
//  MapViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/13/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController : UIViewController<GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *subViewMap;
@property (weak, nonatomic) IBOutlet UIImageView *mapPin;

@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *aptNumber;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;

@end

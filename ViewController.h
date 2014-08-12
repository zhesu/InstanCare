//
//  ViewController.h
//  InstanCare
//
//  Created by Zhe Su on 7/29/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//@interface ViewController : UIViewController <CoreLocationControllerDelegate>
@property (strong, nonatomic) NSArray *imageFilesArray;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *payFees;
@end

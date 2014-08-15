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

@end

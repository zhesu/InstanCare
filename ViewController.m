//
//  ViewController.m
//  InstanCare
//
//  Created by Zhe Su on 7/29/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.showsUserLocation = YES;

 }

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    // Create coordinates from location lat/long
    CLLocationCoordinate2D coordinate = userLocation.location.coordinate;
    
    // Zoom to region
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 750, 750);
    mapView.region = viewRegion;

    // Plot pin
 /*   MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = coordinate;
    [self.mapView addAnnotation:pin];*/
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


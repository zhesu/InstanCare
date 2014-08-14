//
//  MapViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/13/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () {
    GMSMapView *mapView_;
    GMSGeocoder *geocoder;
    //GMSAddress *result;
    NSString *addressLine1;
    NSString *addressLine2;
    BOOL firstLocationUpdate_;
}

@end

@implementation MapViewController

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
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:34.052234
                                                            longitude:-118.243685
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:self.subViewMap.bounds camera:camera];
    mapView_.delegate = self;
    mapView_.settings.compassButton = YES;
    mapView_.myLocationEnabled = YES;
    mapView_.settings.myLocationButton = YES;
    // Listen to the myLocation property of GMSMapView.
    [mapView_ addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    [self.subViewMap addSubview:mapView_];
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });
    //NSLog(@"User's location: %@", mapView_.myLocation);


    // Do any additional setup after loading the view.
}

- (void)dealloc {
    [mapView_ removeObserver:self
                  forKeyPath:@"myLocation"
                     context:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [mapView_ animateToLocation:newLocation.coordinate];
    // some code...
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
#pragma mark - KVO updates

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (!firstLocationUpdate_) {
        // If the first location update has not yet been recieved, then jump to that
        // location.
        firstLocationUpdate_ = YES;
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                         zoom:14];
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
        marker.title = @"Home";
        marker.snippet = @"USA";
        marker.map = mapView_;
    }
}
/*
#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
} */
#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
    [mapView clear];
}

- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:cameraPosition.target completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        GMSMarker *marker = [GMSMarker markerWithPosition:cameraPosition.target];
        NSLog(@"reverse geocoding results:");
        for(GMSAddress* addressObj in [response results])
        {
            NSLog(@"coordinate.latitude=%f", addressObj.coordinate.latitude);
            NSLog(@"coordinate.longitude=%f", addressObj.coordinate.longitude);
            NSLog(@"thoroughfare=%@", addressObj.thoroughfare);
            NSLog(@"locality=%@", addressObj.locality);
            NSLog(@"subLocality=%@", addressObj.subLocality);
            NSLog(@"administrativeArea=%@", addressObj.administrativeArea);
            NSLog(@"postalCode=%@", addressObj.postalCode);
            NSLog(@"country=%@", addressObj.country);
            NSLog(@"lines=%@", addressObj.lines);
        }
        marker.title = response.firstResult.addressLine1;
        marker.snippet = response.firstResult.addressLine2;
        marker.map = mapView_;
    }];

}
@end

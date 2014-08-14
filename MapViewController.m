//
//  MapViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/13/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController () {
    GMSMapView *mapView_;
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
/*- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Implement here to check if already KVO is implemented.
    [mapView_ addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionNew context: nil];
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:self.subViewMap.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    NSLog(@"User's location: %@", mapView_.myLocation);
    [self.subViewMap addSubview:mapView_];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;

    
    // in viewDidLoad method...
    // Listen to the myLocation property of GMSMapView.
/*    [mapView_ addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });
    
*/
    // Do any additional setup after loading the view.
}
/*
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [mapView_ animateToLocation:newLocation.coordinate];
    // some code...
}
*/
/*- (void)observeValueForKeyPath:(NSString *)keyPath
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
    }
}*/
/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"myLocation"] && [object isKindOfClass:[GMSMapView class]])
    {
        //[mapView_ animateToCameraPosition:[GMSCameraPosition cameraWithLatitude:mapView_.myLocation.coordinate.latitude
                                                                                 //longitude:mapView_.myLocation.coordinate.longitude
                                                                                 //     zoom:mapView_.projection.zoom]];
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                         zoom:14];
    }
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

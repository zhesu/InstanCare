//
//  ViewController.m
//  InstanCare
//
//  Created by Zhe Su on 7/29/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
@interface ViewController () {
    NSMutableArray *Payment;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.showsUserLocation = YES;
    //[self queryParseMethod];
    //NSLog(@"%@", _payFees);

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
/*- (void)queryParseMethod {
    // Create the data model
    
    NSLog(@"start query");
    PFQuery *query = [PFQuery queryWithClassName:@"doctorFees"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _imageFilesArray = [[NSArray alloc] initWithArray:objects];
                   NSLog(@"%@", _imageFilesArray);
            //[imagesCollection reloadData];
        }
        PFObject *tempObject = [_imageFilesArray objectAtIndex:0];
        NSMutableArray *Fees1 = [tempObject objectForKey:@"Fees"];
        //NSLog(@"%@", Fees1);
        PFObject *tempObject2 = [_imageFilesArray objectAtIndex:1];
        NSMutableArray *Fees2 = [tempObject2 objectForKey:@"Fees"];
        //NSLog(@"%@", Fees2);
        Payment = @[Fees1, Fees2];
        //NSLog(@"%@", Payment);
        _payFees = Payment;
        //NSLog(@"%@", _payFees);
    }];
 
} */
/*#pragma mark
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"NewViewController"]) {
        
        NewViewController *destViewController = segue.destinationViewController;
        
        destViewController.pageFees = Payment;
        
    }
}
*/
@end


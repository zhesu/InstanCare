//
//  addressViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/14/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "addressViewController.h"
#import "homeViewController.h"

@interface addressViewController () {
    NSString *preferredAddress;
}

@end

@implementation addressViewController
@synthesize addressTable;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(retrieveFromParse)];
}

- (void) retrieveFromParse {
    
    PFQuery *retrieveColors = [PFQuery queryWithClassName:@"tableView"];
    
    [retrieveColors findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            addressArray = [[NSMutableArray alloc] initWithArray:objects];
        }
        //NSLog(@"%@", addressArray);
        [addressTable reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//*********************Setup table of folder names ************************

//get number of sections in tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of folders
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return addressArray.count;
}

//setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //setup cell
    static NSString *CellIdentifier = @"addressCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
    PFObject *tempObject = [addressArray objectAtIndex:indexPath.row];
    UIImage *image1 = [UIImage imageNamed:@"mappin.png"];
    cell.imageView.image = image1;
    NSString *fullAddress = [NSString stringWithFormat:@"%@, %@", [tempObject objectForKey:@"address"], [tempObject objectForKey:@"city"]];
    
    cell.textLabel.text = fullAddress;
    
    return cell;
}


//user selects folder to add tag to
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell tapped");
    PFObject *tempObject = [addressArray objectAtIndex:indexPath.row];
    NSLog(@"%@", tempObject.objectId);
    NSLog(@"%@", [tempObject objectForKey:@"address"]);
    // Configure the new event with information from the location.
	//CLLocationCoordinate2D coordinate = [location coordinate];
    preferredAddress = [NSString stringWithFormat:@"%@, %@ %@", [tempObject objectForKey:@"address"], [tempObject objectForKey:@"city"], [tempObject objectForKey:@"zipcode"]];
    PFUser *user = [PFUser currentUser];
    //NSString *userID = user.objectId;
    //NSLog(@"Parse User ObjectID: %@",userID);
    //NSLog(@"%@",user);
    [user setObject:preferredAddress forKey:@"preferredAddress"];
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //NSLog(@"user address saved");
            //     NSLog(@"%@",preferredAddress);
        } else {
            // There was an error saving the currentUser.
        }
            NSLog(@"%@",user);
        
    }];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        // Row selection
        NSIndexPath *indexPath = [addressTable indexPathForSelectedRow];
        PFObject *object = [addressArray objectAtIndex:indexPath.row];
        [segue.destinationViewController setDetailItem:object];
    }
} */

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        PFObject *userData = [addressArray objectAtIndex:indexPath.row];
        NSLog(@"delete row %@",userData);
        [userData deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(!error){
                [addressArray removeObjectAtIndex:indexPath.row];
                [tableView reloadData];
            }
            else
            {
                // check error
            }
        }]; 
    }
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
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

/*
- (IBAction)Close:(id)sender {
    [self.delegate addressViewControllerDidCancel:self];
}
*/

@end

//
//  addressViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/14/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "addressViewController.h"

@interface addressViewController ()

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
        NSLog(@"%@", addressArray);
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
    cell.textLabel.text = [tempObject objectForKey:@"cellTitle"];
    
    return cell;
}


//user selects folder to add tag to
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell tapped");
}

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


@end

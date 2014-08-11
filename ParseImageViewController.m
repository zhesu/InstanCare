//
//  ParseImageViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/10/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "ParseImageViewController.h"

@interface ParseImageViewController ()

@end

@implementation ParseImageViewController
@synthesize parseImage;

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
    [self performSelector:@selector(queryParseMethod)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self performSelector:@selector(queryParseMethod)];
    // Dispose of any resources that can be recreated.
}

- (void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        NSLog(@"Retrieved data");
        
        if (!error) {
            PFFile *imageFile = [object objectForKey:@"imageFile"];
//            [parseImage setImage:file];
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    parseImage.image = [UIImage imageWithData:data];
                }
            }];
        }
    //[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //[query getObjectInBackgroundWithId:@"objectid"
                                // block:^(PFObject *objects, NSError *error) {
        //NSLog(@"%@", objects);
        /*if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            NSLog(@"%@", imageFilesArray);
        }*/
        // do your thing with text
      //  [parseImage reloadData];
    }];
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

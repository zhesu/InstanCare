//
//  PageContentViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/1/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController
//@synthesize showPopupBtn;


- (void)viewDidLoad
{
    [super viewDidLoad];
   // [self performSelector:@selector(queryParseMethod)];
   // [self setRoundedBorder:5 borderWidth:1 color:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forButton:showPopupBtn];

    // Do any additional setup after loading the view.
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
}

- (IBAction)showPopUp:(id)sender {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        self.popViewController = [[PopUpViewController alloc] initWithNibName:@"PopUpViewController_iPad" bundle:nil];
        [self.popViewController setTitle:@"This is a popup view"];
        
        [self.popViewController showInView:self.view withImage:[UIImage imageNamed:@"typpzdemo"] withMessage:@"You just triggered a great popup window" animated:YES];
    } else {
        self.popViewController = [[PopUpViewController alloc] initWithNibName:@"PopUpViewController" bundle:nil];
        [self.popViewController setTitle:@"This is a popup view"];
        
        [self.popViewController showInView:self.view withImage:[UIImage imageNamed:@"typpzdemo"] withMessage:@"You just triggered a great popup window" animated:YES];
    }
}

- (void)setRoundedBorder:(float)radius borderWidth:(float)borderWidth color:(UIColor*)color forButton:(UIButton *)button
{
    CALayer * l = [button layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:radius];
    // You can even add a border
    [l setBorderWidth:borderWidth];
    [l setBorderColor:[color CGColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //NSLog(@"%@", objects);
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            //NSLog(@"%lu", (unsigned long)imageFilesArray.count);
        }
        //NSLog(@"%@", imageFilesArray);
        PFObject *tempObject = [imageFilesArray objectAtIndex:0];
        NSString *FirstName = [tempObject objectForKey:@"FirstName"];
        NSString *LastName =[tempObject objectForKey:@"LastName"];
        NSString *Credential =[tempObject objectForKey:@"Credential"];
        self.NameTitle.text = [NSString stringWithFormat:@"%@ %@ %@", FirstName, LastName, Credential];
        self.Treats.text = [tempObject objectForKey:@"Treats"];
        self.Specialties.text = [tempObject objectForKey:@"Specialties"];
        self.Education.text = [tempObject objectForKey:@"Education"];
        self.Fees.text = [tempObject objectForKey:@"Fees"];
        
        PFFile *imageFile = [tempObject objectForKey:@"imageFile"];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                //NSLog(@"%@", data);
                _backgroundImageView.image = [UIImage imageWithData:data];
                
            }
            
        }];
        
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

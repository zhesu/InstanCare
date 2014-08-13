//
//  secondViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/1/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import <Parse/Parse.h>

@interface secondViewController : UIViewController <UIPageViewControllerDataSource> {
      //NSArray *imageFilesArray;
      //NSMutableArray *imageArray;
}

//- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *imageFilesArray;
@property (strong, nonatomic) NSArray *pageFirstName;
@property (strong, nonatomic) NSArray *pageLastName;
@property (strong, nonatomic) NSArray *pageCredential;
@property (strong, nonatomic) NSArray *pageTreats;
@property (strong, nonatomic) NSArray *pageSpecialties;
@property (strong, nonatomic) NSArray *pageNameTitle;
@property (strong, nonatomic) NSArray *pageEducation;
@property (strong, nonatomic) NSArray *pageFees;
@property (strong, nonatomic) PFFile *pageImage2;
@property (strong, nonatomic) PFFile *pageImage1;
//@property NSString *pageFees;
@property (strong, nonatomic) NSMutableArray *imageArray;
@end

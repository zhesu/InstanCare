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
      NSArray *imageFilesArray;
      NSMutableArray *imageArray;
}

//- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end

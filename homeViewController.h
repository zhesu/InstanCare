//
//  homeViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/15/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface homeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) NSArray *imageFilesArray;
@property (strong, nonatomic) NSMutableArray *imageArray;
@end

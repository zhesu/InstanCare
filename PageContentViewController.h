//
//  PageContentViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/1/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>

@interface PageContentViewController : UIViewController {
    NSArray *imageFilesArray;
    NSMutableArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property PFFile *imageFile2;
@property NSData *imageData;
@property (weak, nonatomic) IBOutlet UIButton *showPopupBtn;
@property (strong, nonatomic) PopUpViewController *popViewController;
@property (weak, nonatomic) IBOutlet UILabel *Treats;
@property (weak, nonatomic) IBOutlet UILabel *Specialties;
@property (weak, nonatomic) IBOutlet UILabel *NameTitle;

@property (weak, nonatomic) IBOutlet UILabel *Education;
@property (weak, nonatomic) IBOutlet UILabel *Fees;
@property NSString *tempFirstName;
@property NSString *tempLastName;
@property NSString *tempCredential;
@property NSString *tempTreats;
@property NSString *tempSpecialties;
@property NSString *tempNameTitle;
@property NSString *tempEducation;
@property NSString *tempFees;
@end

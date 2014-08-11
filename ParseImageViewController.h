//
//  ParseImageViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/10/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ParseImageViewController : UIViewController {
    NSArray *imageFilesArray;
    NSMutableArray *imageArray;
}

@property (weak, nonatomic) IBOutlet UIImageView *parseImage;
@property (weak, nonatomic) IBOutlet UILabel *Treats;
@property (weak, nonatomic) IBOutlet UILabel *Specialties;
@property (weak, nonatomic) IBOutlet UILabel *NameTitle;

@property (weak, nonatomic) IBOutlet UILabel *Education;
@property (weak, nonatomic) IBOutlet UILabel *Fees;
@end

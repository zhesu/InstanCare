//
//  PopupViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/6/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
//#import <Parse/Parse.h>
@interface PopUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UIImageView *popupImg;
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *nameTitle;
@property (weak, nonatomic) IBOutlet UILabel *Fees;
@property PFFile *image;
@property NSData *imageData;

- (IBAction)closePopup:(id)sender;
- (IBAction)confirmBtn:(id)sender;

//- (void)showInView:(UIView *)aView withImage:(UIImage *)image withMessage:(NSString *)message animated:(BOOL)animated;


- (void)showInView:(UIView *)aView withImageFile:(PFFile *)image withMessage:(NSString *)nameTitle withMessage:(NSString *)address withMessage: (NSString *)fees animated:(BOOL)animated;

@end

//
//  PopupViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/6/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "PopUpViewController.h"

@interface PopUpViewController ()

@end

@implementation PopUpViewController

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
    self.view.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.6];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.layer.shadowOpacity = 0.8;
    self.popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)showAnimate
{
    self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.view.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 1;
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}

- (IBAction)closePopup:(id)sender {
    [self removeAnimate];
}

- (IBAction)confirmBtn:(id)sender {
    // Create our Installation query
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
    
    // Send push notification to query
    [PFPush sendPushMessageToQueryInBackground:pushQuery
                                   withMessage:@"Your doctor will call you to confirm in a minute."];

}

- (void)removeAnimate
{
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
        }
    }];
}



- (void)showInView:(UIView *)aView withImageFile:(PFFile *)image withMessage:(NSString *)nameTitle withMessage:(NSString *)address withMessage: (NSString *)fees animated:(BOOL)animated
{

    dispatch_async(dispatch_get_main_queue(), ^{
        [aView addSubview:self.view];
        //NSLog(@"%@", image);
 //       self.popupImg.image = image;
        [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                //NSLog(@"%@", error);
                //NSLog(@"%@", data);
                _popupImg.image = [UIImage imageWithData:data];
                
            }
            
        }];
        self.address.text = address;
        self.Fees.text = fees;
        self.nameTitle.text = nameTitle;
        if (animated) {
            [self showAnimate];
        }
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

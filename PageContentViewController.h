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

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property (weak, nonatomic) IBOutlet UIButton *showPopupBtn;
@property (strong, nonatomic) PopUpViewController *popViewController;

@end

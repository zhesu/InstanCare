//
//  thirdViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/6/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface thirdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *showPopupBtn;
@property (strong, nonatomic) PopUpViewController *popViewController;
@end

//
//  thirdViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/6/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "thirdViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController
@synthesize showPopupBtn;

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
    [super viewDidLoad];
    [self setRoundedBorder:5 borderWidth:1 color:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forButton:showPopupBtn];
    // Do any additional setup after loading the view.
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

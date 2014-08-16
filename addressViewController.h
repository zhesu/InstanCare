//
//  addressViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/14/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@class addressViewController;
@protocol addressViewControllerDelegate <NSObject>
- (void)addressViewControllerDidCancel:(addressViewController *)controller;

@end
@interface addressViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *addressArray;
}
@property (weak, nonatomic) IBOutlet UITableView *addressTable;
@property (nonatomic, weak) id <addressViewControllerDelegate> delegate;
//- (IBAction)Close:(id)sender;

@end

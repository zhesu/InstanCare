//
//  addressViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/14/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface addressViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *addressArray;
}
@property (weak, nonatomic) IBOutlet UITableView *addressTable;

@end

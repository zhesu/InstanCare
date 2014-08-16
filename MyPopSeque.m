//
//  MyPopSeque.m
//  InstanCare
//
//  Created by Zhe Su on 8/16/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "MyPopSeque.h"

@implementation MyPopSeque

- (void) perform {
    UIViewController *source = (UIViewController *)self.sourceViewController;
    [source.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end

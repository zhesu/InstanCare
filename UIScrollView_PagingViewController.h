//
//  UIScrollView_PagingViewController.h
//  InstanCare
//
//  Created by Zhe Su on 8/1/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView_PagingViewController : UIViewController <UIScrollViewDelegate> {
    UIScrollView* scrollView;
    UIPageControl* pageControl;
    BOOL pageControlBeingUsed;
}
@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
- (IBAction)changePage;
@end

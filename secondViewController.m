//
//  secondViewController.m
//  InstanCare
//
//  Created by Zhe Su on 8/1/14.
//  Copyright (c) 2014 Zhe Su. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController
//@synthesize showPopupBtn;

- (void)viewDidLoad
{
    [super viewDidLoad];

    //_pageFees = [[NSArray alloc] init];
    //[self performSelector:@selector(queryParseMethod)];
    [self queryParseMethod];
	// Create the data model
   // _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
   // _pageImages = @[@"page1.png", @"page2.png"];//, @"page3.png", @"page4.png"];
/*    NSLog(@"%@", _pageImages);
    PFQuery *query = [PFQuery queryWithClassName:@"doctorFees"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _imageFilesArray = [[NSArray alloc] initWithArray:objects];
            //       NSLog(@"%@", _imageFilesArray);
            //[imagesCollection reloadData];
        }
        PFObject *tempObject = [_imageFilesArray objectAtIndex:0];
        NSString *Fees1 = [tempObject objectForKey:@"Fees"];
        //NSLog(@"%@", Fees1);
        PFObject *tempObject2 = [_imageFilesArray objectAtIndex:1];
        NSString *Fees2 = [tempObject2 objectForKey:@"Fees"];
        //NSLog(@"%@", Fees2);
        _pageFees = @[Fees1, Fees2];
            NSLog(@"%@", _pageFees);
    }];
*/
    NSLog(@"%@", _pageFees);
    



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSArray *)queryParseMethod {
- (void)queryParseMethod {
    // Create the data model

    //NSLog(@"start query");
    PFQuery *query = [PFQuery queryWithClassName:@"doctorFees"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _imageFilesArray = [[NSArray alloc] initWithArray:objects];
     //       NSLog(@"%@", _imageFilesArray);
            //[imagesCollection reloadData];
        }
        PFObject *tempObject = [_imageFilesArray objectAtIndex:0];
        NSString *Fees1 = [tempObject objectForKey:@"Fees"];
        //NSLog(@"%@", Fees1);
        PFObject *tempObject2 = [_imageFilesArray objectAtIndex:1];
        NSString *Fees2 = [tempObject2 objectForKey:@"Fees"];
        //NSLog(@"%@", Fees2);
        _pageFees = @[Fees1, Fees2];
            NSLog(@"queryParseMethod");
        _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
        _pageImages = @[@"page1.png", @"page2.png"];//, @"page3.png", @"page4.png"];
        // Create page view controller
        self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
        self.pageViewController.dataSource = self;
        
        PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
        NSArray *viewControllers = @[startingViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
        // Change the size of page view controller
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40);
        
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
        [self.pageViewController didMoveToParentViewController:self];
       //NSLog(@"%@", _pageFees);
        //[_pageFees addObject:cArray];
       // [_pageFees addObject:Fees1];
        //NSLog(@"%@", _pageFees);
       // [_pageFees addObject:Fees2];
        //_pageFees = [tempObject objectForKey:@"Fees"];
       // NSLog(@"%@", _pageFees);
     /*   self.NameTitle.text = [NSString stringWithFormat:@"%@ %@ %@", FirstName, LastName, Credential];
        self.Treats.text = [tempObject objectForKey:@"Treats"];
        self.Specialties.text = [tempObject objectForKey:@"Specialties"];
        self.Education.text = [tempObject objectForKey:@"Education"];
        self.Fees.text = [tempObject objectForKey:@"Fees"];
*/
   }];
   // NSLog(@"%@", _pageFees);
  //  return _pageFees;

}

/*
- (void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"doctorImage"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    NSLog(@"%@", objects);
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            NSLog(@"%lu", (unsigned long)imageFilesArray.count);
        }
        _pageImages = imageFilesArray;
        //NSLog(@"%@", imageFilesArray);
        PFObject *tempObject = [imageFilesArray objectAtIndex:0];
        PFFile *imageFile = [tempObject objectForKey:@"imageFile"];
        NSLog(@"%@", imageFile);
        PFObject *tempObject2 = [imageFilesArray objectAtIndex:1];
        PFFile *imageFile2 = [tempObject2 objectForKey:@"imageFile"];
        NSLog(@"%@", imageFile2);
        //_pageImages = @[imageFile, imageFile2];
                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                //NSLog(@"%@", data);
                
            }
            
        }];
        
    }];
    
}
*/
/*- (IBAction)startWalkthrough:(id)sender {
 //   PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
 //   NSArray *viewControllers = @[startingViewController];
 //   [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
 NSLog(@"string");
 PopUpViewController *myViewController = [[PopUpViewController alloc] init];
 
 [self presentViewController:myViewController animated:YES completion:nil];
 } */




- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageImages count] == 0) || (index >= [self.pageImages count])) {
        return nil;
    }
   // NSLog(@"%lu", (unsigned long)index);
 //   PFObject *imageObject = [imageFilesArray objectAtIndex:NSIndexPath.row];
 //   PFFile *imageFile = [imageObject objectForKey:@"imageFile"];
    //[self queryParseMethod];
    NSLog(@"PageContentViewController");
    NSLog(@"%@", _pageFees);
    NSLog(@"%@", _pageTitles);

    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    //NSLog(@"%@", pageContentViewController.imageFile);
    pageContentViewController.titleText = self.pageTitles[index];
   // NSLog(@"%@", _pageFees);
    pageContentViewController.Price = self.pageFees[index];
 //   NSLog(@"%@", _pageFees[index]);
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
     NSLog(@"%@", pageContentViewController);
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    NSLog(@"%lu", (unsigned long)index);
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    NSLog(@"%lu", (unsigned long)index);
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end

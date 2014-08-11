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
    //[self performSelector:@selector(queryParseMethod)];
    PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%@", objects);
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            NSLog(@"%lu", (unsigned long)imageFilesArray.count);
        }
        //NSLog(@"%@", imageFilesArray);
        PFObject *tempObject = [imageFilesArray objectAtIndex:0];
        PFFile *imageFile = [tempObject objectForKey:@"imageFile"];
        PFObject *tempObject2 = [imageFilesArray objectAtIndex:0];
        PFFile *imageFile2 = [tempObject2 objectForKey:@"imageFile"];
        //_pageImages = @[imageFile, imageFile2];
  }];
	// Create the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    NSLog(@"%@", objects);
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            NSLog(@"%lu", (unsigned long)imageFilesArray.count);
        }
        //NSLog(@"%@", imageFilesArray);
      //  PFObject *tempObject = [imageFilesArray objectAtIndex:0];
       // PFFile *imageFile = [tempObject objectForKey:@"imageFile"];
       // PFObject *tempObject2 = [imageFilesArray objectAtIndex:0];
        //PFFile *imageFile2 = [tempObject2 objectForKey:@"imageFile"];
       // _pageImages = @[imageFile, imageFile2];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                //NSLog(@"%@", data);
                parseImage.image = [UIImage imageWithData:data];
                
            }
            
        }]; */
        
//    }];
    
//}

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
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end

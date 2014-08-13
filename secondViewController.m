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

    [self performSelector:@selector(queryParseMethod)];

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
        //NSLog(@"%@", objects);
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            //NSLog(@"%lu", (unsigned long)imageFilesArray.count);
        }
        //NSLog(@"%@", imageFilesArray);
        PFObject *tempObject = [imageFilesArray objectAtIndex:0];
        NSString *FirstName = [tempObject objectForKey:@"FirstName"];
        NSString *LastName =[tempObject objectForKey:@"LastName"];
        NSString *Credential =[tempObject objectForKey:@"Credential"];
        self.NameTitle.text = [NSString stringWithFormat:@"%@ %@ %@", FirstName, LastName, Credential];
        self.Treats.text = [tempObject objectForKey:@"Treats"];
        self.Specialties.text = [tempObject objectForKey:@"Specialties"];
        self.Education.text = [tempObject objectForKey:@"Education"];
        self.Fees.text = [tempObject objectForKey:@"Fees"];
        
        PFFile *imageFile = [tempObject objectForKey:@"imageFile"];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                //NSLog(@"%@", data);
                parseImage.image = [UIImage imageWithData:data];
                
            }
            
        }];
        
    }];
    */
- (void)queryParseMethod {
    // Create the data model

    //NSLog(@"start query");
    PFQuery *query = [PFQuery queryWithClassName:@"doctorData"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        if (!error) {
            _imageFilesArray = [[NSArray alloc] initWithArray:objects];
         }
        //NSLog(@"%@", _imageFilesArray);
        PFObject *temp = [_imageFilesArray objectAtIndex:0];
        NSString *FirstName1 = [temp objectForKey:@"FirstName"];
        NSString *LastName1 = [temp objectForKey:@"LastName"];
        NSString *Credential1 = [temp objectForKey:@"Credential"];
        NSString *Treats1 = [temp objectForKey:@"Treats"];
        NSString *Specialties1 = [temp objectForKey:@"Specialties"];
        NSString *NameTitle1 = [temp objectForKey:@"FirstName"];
        NSString *Education1 = [temp objectForKey:@"Education"];
        NSString *Fees1 = [temp objectForKey:@"Fees"];
        PFFile *image1 = [temp objectForKey:@"imageFile"];

        PFObject *temp2 = [_imageFilesArray objectAtIndex:1];
        NSString *FirstName2 = [temp2 objectForKey:@"FirstName"];
        NSString *LastName2 = [temp2 objectForKey:@"LastName"];
        NSString *Credential2 = [temp2 objectForKey:@"Credential"];
        NSString *Treats2 = [temp2 objectForKey:@"Treats"];
        NSString *Specialties2 = [temp2 objectForKey:@"Specialties"];
        NSString *NameTitle2 = [temp2 objectForKey:@"FirstName"];
        NSString *Education2 = [temp2 objectForKey:@"Education"];
        NSString *Fees2 = [temp2 objectForKey:@"Fees"];
        PFFile *image2 = [temp2 objectForKey:@"imageFile"];
        
        _pageFirstName =@[FirstName1, FirstName2];
        _pageLastName =@[LastName1, LastName2];
        _pageCredential =@[Credential1, Credential2];
        _pageTreats = @[Treats1, Treats2];
        _pageSpecialties = @[Specialties1, Specialties2];
        _pageNameTitle = @[NameTitle1, NameTitle2];
        _pageEducation = @[Education1, Education2];
        _pageFees = @[Fees1, Fees2];
        _pageImage1 = image1;
        _pageImage2 = image2;//@[image1, image2];
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

    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    if (index == 0) {
        NSLog(@"%lu", (unsigned long) index);
        pageContentViewController.imageFile2 = self.pageImage1;
    } else {
        NSLog(@"%lu", (unsigned long) index);
        pageContentViewController.imageFile2 = self.pageImage2;
    }
    //pageContentViewController.imageFile = self.pageImages[index];
    //pageContentViewController.imageFile2 = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.tempFirstName = self.pageFirstName[index];
    pageContentViewController.tempLastName = self.pageLastName[index];
    pageContentViewController.tempCredential = self.pageCredential[index];
    pageContentViewController.tempTreats = self.pageTreats[index];
    pageContentViewController.tempSpecialties = self.pageSpecialties [index];
    pageContentViewController.tempNameTitle = self.pageNameTitle[index];
    pageContentViewController.tempEducation = self.pageEducation[index];
    pageContentViewController.tempFees = self.pageFees[index];
    pageContentViewController.pageIndex = index;
    //pageContentViewController.imageData = self.
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

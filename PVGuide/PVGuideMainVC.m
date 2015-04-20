//
//  TutorialUnderPageVC.m
//  Smart Record
//
//  Created by Patrik Vaberer on 3/27/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "PVGuideMainVC.h"
#import "TutorialVC.h"
#import "AnimatorPVGuide.h"


#define dDeviceOrientation [[UIDevice currentDevice] orientation]
#define isLandscape UIDeviceOrientationIsLandscape(dDeviceOrientation)





@interface PVGuideMainVC ()<UIPageViewControllerDataSource, UIViewControllerTransitioningDelegate>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIView *vTopBar;
@property (weak, nonatomic) IBOutlet UILabel *lTitle;

@property (weak, nonatomic) IBOutlet UIButton *bClose;

@end

@implementation PVGuideMainVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lTitle.text = self.guideTitle;
    self.transitioningDelegate = self;

    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PVPageVC"];
    self.pageViewController.dataSource = self;
    
    TutorialVC *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    
    self.pageViewController.view.frame = CGRectMake(0,50, self.view.frame.size.width, self.view.frame.size.height- (50));
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    __weak UIPageViewController* pvcw = self.pageViewController;
    __weak PVGuideMainVC *mySelf = self;
    [self.pageViewController setViewControllers:@[[self viewControllerAtIndex:self.pageIndex]]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES completion:^(BOOL finished) {
                                           UIPageViewController* pvcs = pvcw;
                                           if (!pvcs) return;
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               [pvcs setViewControllers:@[[mySelf viewControllerAtIndex:mySelf.pageIndex]]
                                                              direction:UIPageViewControllerNavigationDirectionForward
                                                               animated:NO completion:nil];
                                           });
                                       }];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (isLandscape == NO) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}








- (TutorialVC *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.data count] == 0) || (index >= [self.data count])) {
        return nil;
    }
    TutorialVC *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.sTitle = self.data[index][title];
    pageContentViewController.sDescription = self.data[index][desc];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialVC*) viewController).pageIndex;
    
    if ( index == NSNotFound) {
        return nil;
    }
    
    index--;
    if (index == -1) {
        return [self viewControllerAtIndex:self.data.count - 1];
    }
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialVC*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.data count]) {
        return [self viewControllerAtIndex:0];
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.data count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


- (IBAction)bClosePressed {
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        if ([self.delegateTutorial respondsToSelector:@selector(didDismissTutorial)]) {
            [self.delegateTutorial didDismissTutorial];
        }
    }];
    
}


//MARK: animators
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[AnimatorPVGuide alloc] initWithShow:YES];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[AnimatorPVGuide alloc] initWithShow:NO];
    
}


@end

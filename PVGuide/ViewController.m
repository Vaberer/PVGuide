//
//  ViewController.m
//  PVGuide
//
//  Created by Patrik Vaberer on 4/20/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "ViewController.h"
#import "PVGuideMainVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (IBAction)bShowGuide {
    
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIStoryboard *storyboard = self.storyboard;
    PVGuideMainVC *controller = (PVGuideMainVC *)[storyboard instantiateViewControllerWithIdentifier:@"PVGuideMainVC"];
    
    
    NSMutableArray *data = [[NSMutableArray alloc]init];
    
    
    
    NSDictionary *dic1 = @{title: @"Welcome to PVGuide",
                           desc: @"Lorem Ipsum dolor 1"
                           };
    [data addObject:dic1];
    
    
    
    NSDictionary *dic2 = @{title: @"Lorem 2",
                           desc: @"Lorem Ipsum dolor 2"
                           };
    [data addObject:dic2];
    
    
    
    NSDictionary *dic3 = @{title: @"Lorem 3",
                           desc: @"Lorem Ipsum dolor 3"
                           };
    [data addObject:dic3];
    
    
    
    
    NSDictionary *dic4 = @{title: @"Lorem 4",
                           desc: @"Lorem Ipsum dolor 4"
                           };
    [data addObject:dic4];
    
    
    
    controller.data = data;
    controller.guideTitle = @"PVGuide";
    
    //UIViewController *c = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *c = self;
    [c presentViewController:controller animated:YES completion:nil];
    
}


@end

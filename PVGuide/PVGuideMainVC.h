//
//  TutorialUnderPageVC.h
//  Smart Record
//
//  Created by Patrik Vaberer on 3/27/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import <UIKit/UIKit.h>

#define title @"title"
#define desc @"description"

@protocol DelegateTutorial <NSObject>

- (void)didDismissTutorial;
@end;

@interface PVGuideMainVC : UIViewController
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) id delegateTutorial;
@property (nonatomic, strong) NSString *guideTitle;

@property NSInteger pageIndex;



@end

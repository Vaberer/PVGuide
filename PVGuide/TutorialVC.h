//
//  TutorialVC.h
//  Smart Record
//
//  Created by Patrik Vaberer on 3/27/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TutorialVC : UIViewController
@property NSUInteger pageIndex;

@property (nonatomic, strong) NSString *sTitle;
@property (nonatomic, strong) NSString *sDescription;
@property BOOL isTutorial;
@end

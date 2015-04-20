//
//  TutorialVC.m
//  Smart Record
//
//  Created by Patrik Vaberer on 3/27/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "TutorialVC.h"

@interface TutorialVC ()



@property (weak, nonatomic) IBOutlet UILabel *lTitle;
@property (weak, nonatomic) IBOutlet UIView *vBackground;
@property (weak, nonatomic) IBOutlet UILabel *lDescription;
@end

@implementation TutorialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lTitle.text = self.sTitle;
    self.lDescription.text = self.sDescription;
    self.vBackground.clipsToBounds = YES;
    self.vBackground.layer.cornerRadius = 10;
   
}




@end

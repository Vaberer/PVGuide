# PVGuide
Simple tutorial with custom transitions


<p align="center">
  <img src="https://github.com/Vaberer/PVGuide/blob/master/demo.gif" />
</p>

<h2>Tutorial</h2>
Simple tutorial with custom transition can be easily implemented.
<br>
Just copy to your storyboard scenes: <code>Page View Controller</code>, <code>Guide MainVC</code> and <code>TutorialVC</code>
<br>
Copy files:<br>
<code>AnimatorPVGuide.h</code><br>
<code>AnimatorPVGuide.m</code><br>

<code>PVGuideMainVC.h</code><br>
<code>PVGuideMainVC.m</code><br>

<code>TutorialVC.h</code><br>
<code>TutorialVC.m</code><br>

<h2>How to call tutorial and populate with data</h2>
```Objective-C


    UIStoryboard *storyboard = self.storyboard;
    PVGuideMainVC *controller = (PVGuideMainVC *)[storyboard instantiateViewControllerWithIdentifier:@"PVGuideMainVC"];
    
    NSMutableArray *data = [[NSMutableArray alloc]init];
    NSDictionary *dic1 = @{title: @"Welcome to PVGuide",
                           desc: @"Lorem Ipsum dolor 1"
                           };
    [data addObject:dic1];
    controller.data = data;
    //top title
    controller.guideTitle = @"PVGuide";
    UIViewController *c = self;
    [c presentViewController:controller animated:YES completion:nil];
```


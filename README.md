# PVGuide
Simple tutorial screen with custom transitions.


<p align="center">
  <img height="480" src="https://github.com/Vaberer/PVGuide/blob/master/demo.gif"/>
</p>

<h2>Installation</h2>
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

PVGuide hides status bar so you need to add to the info.plist key <code>View controller-based status bar appearance</code> with value <code>NO</code>.<br>
<img src="https://github.com/Vaberer/PVGuide/blob/master/plist.png"/>

<h2>How to call tutorial and populate with data</h2>
```Objective-C


    UIStoryboard *storyboard = self.storyboard;
    PVGuideMainVC *controller = (PVGuideMainVC *)[storyboard instantiateViewControllerWithIdentifier:@"PVGuideMainVC"];
    controller.delegateTutorial = self; //in case to call delegate
    
    NSMutableArray *data = [[NSMutableArray alloc]init];
    NSDictionary *dic1 = @{title: @"Welcome to PVGuide",
                           desc: @"Lorem Ipsum dolor 1"
                           };
    [data addObject:dic1];
    controller.data = data;
    controller.guideTitle = @"PVGuide"; //top title
    [self presentViewController:controller animated:YES completion:nil];
```

<h2>Delegate</h2>
To implement delegate, use <code>DelegateTutorial</code> and call<br>
```Objective-C
- (void)didDismissTutorial {}
```



<h2>Author</h2>

Patrik Vaberer, patrik.vaberer@gmail.com<br/>
<a target="_blank" href="https://sk.linkedin.com/in/vaberer">LinkedIn</a><br>
<a target="_blank" href="http://vaberer.me">Blog</a>


<h2>Licence</h2>

PVGuide is available under the MIT license. See the LICENSE file for more info.

# TopTabBarViewController 
*(Still in development)*

**TopTabBarViewController** is UIViewController subclass that helps you to handle two or more child view controllers, and the transitions between them, creating a button bar (according the view controller's title). It is very useful when you have to show subsections in the same view controller, similar to the TabBarViewController.

![Demo for TopTabBarViewController](https://raw.githubusercontent.com/Jadekin/Jadekin.github.io/master/Projects/Demos/TopBabBarViewController.gif "Demo for TopTabBarViewController")


## Requirements

Objective-C, XCode 8, iOS 9+


## Code Example

1. Add TopTabBarViewController class and Button Bar class to your project.
2. Create UIViewController in Storyboard and set TopTabBarViewController class as a subclass.
3. 
```objectivec
    if ([segue.identifier isEqualToString:@"toTopTabBarViewController"]) {
        
        TopTabBarViewController *topTabBarViewController = segue.destinationViewController;
        
        topTabBarViewController.view.backgroundColor = [UIColor clearColor];
        
        UIViewController *greenViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"greenViewController"];
        UIViewController *redViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"redViewController"];
        
        topTabBarViewController.topTabBarViewControllers = @[greenViewController, redViewController];
    }
```

## Motivation

For a work project, I needed two subsections in the same view controller. At first, I created two buttons directly in the Storyboard and two child view controllers. But then I realized that I had to replicate the same UI in several parts of the application and, even, I had to handle more than two buttons. For that reason, I created TopTabBarViewController, that use the view controllers's titles to create a string array that it is use as a source to create the buttons I needed.


## Installation

Download the project and add TopTabBarViewController and ButtonBarView classes to your project.

## TO DO / Future Improvements

- [ ] Swift 3.0 version.
- [ ] Use Autolayout with NSLayoutAnchor.
- [ ] ButtonBarView with Images as a source.
- [ ] Improve ButtonBarView customization using delegates.
- [ ] Use UIScrollView when ButtonBarView has more than 5 buttons.
- [ ] Add more customizations for selected button state.
- [ ] CocoaPods or Carthage.
- [ ] Better documentation.
- [ ] Testing.

## License

Copyright (c) 2015 Karen Pinzás Morrongiello. Read the Licence above.


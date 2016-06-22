# TopTabBarViewController 
*(Still in development)*

**TopTabBarViewController** is UIViewController subclass that helps you to handle two or more child view controllers, and the transitions between them, creating a button bar (according the view controller's title). It is very useful when you have to show subsections in the same view controller, similar to the TabBarViewController.

![Demo for TopTabBarViewController](https://raw.githubusercontent.com/Jadekin/Jadekin.github.io/master/Projects/Demos/TopBabBarViewController.gif "Demo for TopTabBarViewController")






Objective-C, XCode 8, iOS 10.


## Code Example

1. Add TopTabBarViewController class and Button Bar class to your project.
2. Create UIViewController in Storyboard and setup TopTabBarViewController as a subclass.
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

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Motivation

When I needed to create a list of buttons, the idea to create a N numbers of the in order to handle their actions seems useless because all the constraints I had to set up. In the other hand, just for a couple of buttons, set up a collection view was complicated. So, for that reason, I created Button Bar View.

## Installation

Provide code examples and explanations of how to get the project.

## Contributors

Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.

## License

Copyright (c) 2015 Karen Pinzás Morrongiello
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


//
//  ViewController.m
//  TopTabBarViewController - Objective C
//
//  Created by Karen Pinzás Morrongiello on 6/21/16.
//  Copyright © 2016 Karen Pinzás Morrongiello. All rights reserved.
//

#import "ViewController.h"
#import "TopTabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toTopTabBarViewController"]) {
        
        TopTabBarViewController *topTabBarViewController = segue.destinationViewController;
        
        topTabBarViewController.view.backgroundColor = [UIColor clearColor];
        
        UIViewController *greenViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"greenViewController"];
        UIViewController *redViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"redViewController"];
        
        topTabBarViewController.topTabBarViewControllers = @[greenViewController, redViewController];
    }
}
@end

//
//  TopTabBarViewController.m
//  TopTabBarViewController - Objective C
//
//  Created by Karen Pinzás Morrongiello on 6/21/16.
//  Copyright © 2016 Karen Pinzás Morrongiello. All rights reserved.
//

#import "TopTabBarViewController.h"


NSString * const TopTabBarViewControllerShowTopTabBar = @"TopTabBarViewControllerShowTopTabBar";
NSString * const TopTabBarViewControllerHideTopTabBar = @"TopTabBarViewControllerHideTopTabBar";

@interface TopTabBarViewController () <ButtonBarViewDelegate>
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) UIView *selectedView;

@end

@implementation TopTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupTopTabBarView];
}

- (void)setTopTabBarViewControllers:(NSArray<UIViewController *> *)topTabBarViewControllers {
    _topTabBarViewControllers = topTabBarViewControllers;
    
    NSMutableArray *viewControllerTitles = [[NSMutableArray alloc] init];
    
    for (UIViewController *viewController in topTabBarViewControllers) {
        [viewControllerTitles addObject:viewController.title];
    }
    
    self.topTabBarView.titles = viewControllerTitles;
    
    [self setSelectedViewController:topTabBarViewControllers[0] animated:YES];
}

- (void)setupTopTabBarView {
    
    self.topTabBarView = [[ButtonBarView alloc] init];
    self.topTabBarView.delegate = self;
    self.topTabBarView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.topTabBarView];
    
    NSLayoutConstraint *topTopTabBarConstraint = [NSLayoutConstraint constraintWithItem:self.topTabBarView
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1
                                                                               constant:0];
    
    NSLayoutConstraint *trailingTopTabBarConstraint = [NSLayoutConstraint constraintWithItem:self.topTabBarView
                                                                                   attribute:NSLayoutAttributeTrailing
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeTrailing
                                                                                  multiplier:1
                                                                                    constant:0];
    
    NSLayoutConstraint *leadingTopTabBarConstraint = [NSLayoutConstraint constraintWithItem:self.topTabBarView
                                                                                  attribute:NSLayoutAttributeLeading
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.view
                                                                                  attribute:NSLayoutAttributeLeading
                                                                                 multiplier:1
                                                                                   constant:0];
    
    NSLayoutConstraint *heightTopTabBarConstraint = [NSLayoutConstraint constraintWithItem:self.topTabBarView
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1
                                                                                  constant:50];
    
    [NSLayoutConstraint activateConstraints:@[topTopTabBarConstraint, trailingTopTabBarConstraint, leadingTopTabBarConstraint, heightTopTabBarConstraint]];
    
    UIView *whiteBackgroundView = [[UIView alloc] init];
    whiteBackgroundView.backgroundColor = [UIColor whiteColor];
    whiteBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:whiteBackgroundView];
    
    NSLayoutConstraint *topWhiteBackgroundViewConstraint = [NSLayoutConstraint constraintWithItem:whiteBackgroundView
                                                                                        attribute:NSLayoutAttributeTop
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.topTabBarView
                                                                                        attribute:NSLayoutAttributeBottom
                                                                                       multiplier:1
                                                                                         constant:0];
    
    NSLayoutConstraint *trailingWhiteBackgroundViewConstraint = [NSLayoutConstraint constraintWithItem:whiteBackgroundView
                                                                                             attribute:NSLayoutAttributeTrailing
                                                                                             relatedBy:NSLayoutRelationEqual
                                                                                                toItem:self.view
                                                                                             attribute:NSLayoutAttributeTrailing
                                                                                            multiplier:1
                                                                                              constant:0];
    
    NSLayoutConstraint *leadingWhiteBackgroundViewConstraint = [NSLayoutConstraint constraintWithItem:whiteBackgroundView
                                                                                            attribute:NSLayoutAttributeLeading
                                                                                            relatedBy:NSLayoutRelationEqual
                                                                                               toItem:self.view
                                                                                            attribute:NSLayoutAttributeLeading
                                                                                           multiplier:1
                                                                                             constant:0];
    
    NSLayoutConstraint *bottomWhiteBackgroundViewConstraint =
    [NSLayoutConstraint constraintWithItem:whiteBackgroundView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0];
    
    [NSLayoutConstraint activateConstraints:@[topWhiteBackgroundViewConstraint, trailingWhiteBackgroundViewConstraint, leadingWhiteBackgroundViewConstraint, bottomWhiteBackgroundViewConstraint]];
    
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController animated:(BOOL)animated {
    
    if (_selectedViewController != selectedViewController) {
        
        UIViewController *previousViewController = self.selectedViewController;
        _selectedViewController = selectedViewController;
        [self addChildViewController:selectedViewController];
        
        selectedViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.view addSubview:selectedViewController.view];
        
        NSMutableArray *constraints = [NSMutableArray array];
        
        self.topConstraint = [NSLayoutConstraint constraintWithItem:selectedViewController.view
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topTabBarView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0];
        
        [constraints addObject:[NSLayoutConstraint constraintWithItem:selectedViewController.view
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:0]];
        
        [constraints addObject:[NSLayoutConstraint constraintWithItem:selectedViewController.view
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:1
                                                             constant:0]];
        
        [constraints addObject:[NSLayoutConstraint constraintWithItem:selectedViewController.view
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeTrailing
                                                           multiplier:1
                                                             constant:0]];
        
        self.selectedView = selectedViewController.view;
        self.topConstraint.active = YES;
        [NSLayoutConstraint activateConstraints:constraints];
        
        if (previousViewController) {
            
            NSInteger newIndex = [self.topTabBarViewControllers indexOfObject:selectedViewController];
            NSInteger previousIndex = [self.topTabBarViewControllers indexOfObject:previousViewController];
            
            CGFloat translationX = CGRectGetWidth(self.view.frame);
            
            if (newIndex < previousIndex) {
                translationX = -translationX;
            }
            
            selectedViewController.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, translationX, 0);
            
            [previousViewController willMoveToParentViewController:nil];
            
            [UIView animateWithDuration:animated ? 0.5 : 0
                                  delay:0
                 usingSpringWithDamping:1
                  initialSpringVelocity:2
                                options:0
                             animations:^{
                                 
                                 selectedViewController.view.transform = CGAffineTransformIdentity;
                                 previousViewController.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -translationX, 0);
                             }
             
                             completion:^(BOOL finished) {
                                 
                                 if (selectedViewController == self.selectedViewController) {
                                     
                                     [previousViewController.view removeFromSuperview];
                                     [previousViewController removeFromParentViewController];
                                     [selectedViewController didMoveToParentViewController:self];
                                 }
                             }];
            
        }
        
        else {
            [self didMoveToParentViewController:self];
        }
    }
    
}

- (void)buttonBarView:(ButtonBarView *)buttonBarView didTouchButtonAtIndex:(NSInteger)index {
    [self.delegate topTabBarViewController:self didChangeSelectedIndex:index];
    [self setSelectedViewController:self.topTabBarViewControllers[index] animated:YES];
}

@end


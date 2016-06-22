//
//  TopTabBarViewController.h
//  TopTabBarViewController - Objective C
//
//  Created by Karen Pinzás Morrongiello on 6/21/16.
//  Copyright © 2016 Karen Pinzás Morrongiello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonBarView.h"


extern NSString * const TopTabBarViewControllerShowTopTabBar;
extern NSString * const TopTabBarViewControllerHideTopTabBar;

@class TopTabBarViewController;

@protocol TopTabBarViewControllerDelegate <NSObject>
- (void)topTabBarViewController:(TopTabBarViewController *)topTabBarViewController didChangeSelectedIndex:(NSInteger)index;
@end

@interface TopTabBarViewController : UIViewController

@property (nonatomic, weak) id <TopTabBarViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray<UIViewController *> *topTabBarViewControllers;
@property (nonatomic, strong) ButtonBarView *topTabBarView;
@property (nonatomic, weak) UIViewController *selectedViewController;

@end


//
//  ButtonBarView.m
//  TopTabBarViewController - Objective C
//
//  Created by Karen Pinzás Morrongiello on 6/21/16.
//  Copyright © 2016 Karen Pinzás Morrongiello. All rights reserved.
//

#import "ButtonBarView.h"

@interface ButtonBarView ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *selectedTopTabBarButtonIndicator;
@property (nonatomic, strong) NSLayoutConstraint *selectedTopTaBarLeadingConstraint;

@end


@implementation ButtonBarView

- (void)setTitles:(NSMutableArray *)titles {
    
    _titles = titles;
    
    [self setupTopTabBarButtons];
}

- (void)setupTopTabBarButtons {
    
    self.buttons = [[NSMutableArray alloc] init];
    UIFont *font = [UIFont fontWithName:@"Avenir-Light" size:14];
    
    __block UIButton *previousButton = nil;
    
    [self.titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:self.titles[idx] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = font;
        
        [button addTarget:self action:@selector(didTouchButton:) forControlEvents:UIControlEventTouchUpInside];
        
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:button];
        
        [self.buttons addObject:button];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[button]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:@{@"button":button}]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-(0)-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:@{@"button":button}]];
        
        if (idx == 0) {
            
            [self addConstraints:
             [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[button]"
                                                     options:0 metrics:nil views:@{@"button":button}]];
        }
        
        
        else if (idx == self.titles.count - 1) {
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousButton]-(0)-[button(==previousButton)]-(0)-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:@{@"button":button, @"previousButton":previousButton}]];
            
            
        }
        
        else {
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousButton]-(0)-[button(==previousButton)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:@{@"button":button, @"previousButton":previousButton}]];
        }
        
        previousButton = button;
        
    }];
    
    self.selectedTopTabBarButtonIndicator = [[UIView alloc] init];
    self.selectedTopTabBarButtonIndicator.backgroundColor = [UIColor blueColor];
    self.selectedTopTabBarButtonIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.selectedTopTabBarButtonIndicator];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button = [self.buttons objectAtIndex:0];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.selectedTopTabBarButtonIndicator
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1
                                                                         constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.selectedTopTabBarButtonIndicator
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:5];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.selectedTopTabBarButtonIndicator
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:button
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:1
                                                                        constant:0];
    
    self.selectedTopTaBarLeadingConstraint =
    [NSLayoutConstraint constraintWithItem:self.selectedTopTabBarButtonIndicator
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:button
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0];
    
    [NSLayoutConstraint activateConstraints:@[bottomConstraint, heightConstraint, widthConstraint, self.selectedTopTaBarLeadingConstraint]];
    
}


- (void)didTouchButton:(UIButton *)button {
    NSInteger index = [self.buttons indexOfObject:button];
    
    [self.delegate buttonBarView:self didTouchButtonAtIndex:index];
    
    [self removeConstraint:self.selectedTopTaBarLeadingConstraint];
    
    self.selectedTopTaBarLeadingConstraint =
    [NSLayoutConstraint constraintWithItem:self.selectedTopTabBarButtonIndicator
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:button
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0];
    
    [self addConstraint:self.selectedTopTaBarLeadingConstraint];
}


- (void)setEnableButtons:(BOOL)enableButtons {
    
    _enableButtons = enableButtons;
    
    for (UIButton *button in self.buttons) {
        
        button.userInteractionEnabled = enableButtons;
    }    
}

@end

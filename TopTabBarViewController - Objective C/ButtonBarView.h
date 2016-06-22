//
//  ButtonBarView.h
//  TopTabBarViewController - Objective C
//
//  Created by Karen Pinzás Morrongiello on 6/21/16.
//  Copyright © 2016 Karen Pinzás Morrongiello. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonBarView;

@protocol ButtonBarViewDelegate <NSObject>

- (void)buttonBarView:(ButtonBarView *)buttonBarView didTouchButtonAtIndex:(NSInteger)index;

@end

@interface ButtonBarView : UIView

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) id <ButtonBarViewDelegate> delegate;
@property (nonatomic) BOOL enableButtons;

@end

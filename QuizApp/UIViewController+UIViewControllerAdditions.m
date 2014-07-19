//
//  UIViewController+UIViewControllerAdditions.m
//  QuizApp
//
//  Created by Christopher Fu on 7/18/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "UIViewController+UIViewControllerAdditions.h"

@implementation UIViewController (UIViewControllerAdditions)

- (UIViewController *)backViewController
{
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    if(numberOfViewControllers < 2)
    {
        return nil;
    }
    else
    {
        return [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
    }
}

@end

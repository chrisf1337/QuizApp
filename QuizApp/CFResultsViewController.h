//
//  CFResultsViewController.h
//  QuizApp
//
//  Created by Christopher Fu on 7/16/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFQuiz.h"

@interface CFResultsViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *lblResults;
@property (nonatomic) CFQuiz *quiz;

@end

//
//  CFResultsViewController.h
//  QuizApp
//
//  Created by Christopher Fu on 7/16/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDFQuiz.h"

@interface CDFResultsViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *lblResults;
@property (nonatomic) CDFQuiz *quiz;

@end

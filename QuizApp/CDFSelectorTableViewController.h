//
//  CFQuizSelectorTableViewController.h
//  QuizApp
//
//  Created by Christopher Fu on 7/17/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDFQuiz.h"
#import "CDFQuizViewController.h"

@interface CDFSelectorTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *quizzes;
@property (nonatomic) CDFQuiz *selectedQuiz;

@end

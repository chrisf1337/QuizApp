//
//  CFViewController.h
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFQuiz.h"
#import "CFResultsViewController.h"

@interface CFQuizViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *lblQuestion;

@property (nonatomic, weak) IBOutlet UILabel *lblAnswerA;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerB;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerC;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerD;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerE;
@property (nonatomic) NSMutableArray *labels;

@property (nonatomic, weak) IBOutlet UIButton *btnAnswerA;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerB;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerC;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerD;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerE;
@property (nonatomic) NSMutableArray *buttons;

@property (nonatomic, weak) IBOutlet UIButton *btnPrevious;
@property (nonatomic, weak) IBOutlet UIButton *btnNext;

@property (nonatomic, weak) IBOutlet UILabel *position;

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *contentHolder;

@property (nonatomic) CFQuiz *quiz;

@property (nonatomic) int selectedChoice;

- (void)showQuestionAtIndex:(int)index;

- (IBAction)pickedA:(id)sender;
- (IBAction)pickedB:(id)sender;
- (IBAction)pickedC:(id)sender;
- (IBAction)pickedD:(id)sender;
- (IBAction)pickedE:(id)sender;

- (IBAction)pickedPrevious:(id)sender;
- (IBAction)pickedNext:(id)sender;

@end

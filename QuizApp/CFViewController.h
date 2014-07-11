//
//  CFViewController.h
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFViewController : UIViewController
{
    NSMutableArray *quizArray;
}

@property (nonatomic, weak) IBOutlet UILabel *lblQuestion;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerA;
@property (nonatomic, weak) IBOutlet UILabel *lblAnswerB;
@property (nonatomic, weak) IBOutlet UIButton *btnShowQuestion;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerA;
@property (nonatomic, weak) IBOutlet UIButton *btnAnswerB;

- (IBAction)showQuestion:(id)sender;
- (IBAction)pickedA:(id)sender;
- (IBAction)pickedB:(id)sender;

@end

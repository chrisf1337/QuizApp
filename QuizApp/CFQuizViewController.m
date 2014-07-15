//
//  CFViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFQuizViewController.h"
#import "CFQuiz.h"

@implementation CFQuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad called!");
    _labels = [[NSMutableArray alloc] init];
    _buttons = [[NSMutableArray alloc] init];
    [_labels addObjectsFromArray:[NSArray arrayWithObjects:self.lblAnswerA,
                                      self.lblAnswerB, self.lblAnswerC,
                                      self.lblAnswerD, self.lblAnswerE, nil]];
    [_buttons addObjectsFromArray:[NSArray arrayWithObjects:self.btnAnswerA,
                                       self.btnAnswerB, self.btnAnswerC,
                                       self.btnAnswerD, self.btnAnswerE, nil]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"quiz1" ofType:@"json"];
    _quiz = [[CFQuiz alloc] initWithPath:path];
    _selectedChoice = -1;
    _position.text = [NSString stringWithFormat:@"%d/%d", _quiz.currentIndex + 1, _quiz.itemCount];
    [self showQuestionAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning called!");
}

// Side effect: Changes self.quiz.currentIndex to the given index.
- (void)showQuestionAtIndex:(int)index
{
    NSLog(@"showQuestionAtIndex called!");
    self.quiz.currentIndex = index;
    [self.lblQuestion setText:[self.quiz currentQuestion]];
    NSLog(@"%d", [self.quiz.currentChoices count]);
    for(int i = 0; i < self.labels.count; i++)
    {
        [(UILabel *)self.labels[i] setHidden:NO];
        [(UIButton *)self.buttons[i] setHidden:NO];
    }
    for(int i = 0; i < self.quiz.currentChoices.count; i++)
    {
        [(UILabel *)self.labels[i] setText:self.quiz.currentChoices[i]];
    }
    for(int i = self.quiz.currentChoices.count; i < self.labels.count; i++)
    {
        [(UILabel*)self.labels[i] setHidden:YES];
        [(UIButton *)self.buttons[i] setHidden:YES];
    }
}

- (IBAction)pickedA:(id)sender
{
    NSLog(@"pickedA called!");
    if(self.selectedChoice == 0)
    {
        self.btnAnswerA.selected = NO;
        self.selectedChoice = -1;
    }
    else
    {
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        self.btnAnswerA.selected = YES;
        self.selectedChoice = 0;
    }
}

- (IBAction)pickedB:(id)sender
{
    NSLog(@"pickedB called!");
    if(self.selectedChoice == 1)
    {
        self.btnAnswerB.selected = NO;
        self.selectedChoice = -1;
    }
    else
    {
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        self.btnAnswerB.selected = YES;
        self.selectedChoice = 1;
    }
}

- (IBAction)pickedC:(id)sender
{
    NSLog(@"pickedC called!");
    if(self.selectedChoice == 2)
    {
        self.btnAnswerC.selected = NO;
        self.selectedChoice = -1;
    }
    else
    {
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        self.btnAnswerC.selected = YES;
        self.selectedChoice = 2;
    }
}

- (IBAction)pickedD:(id)sender
{
    NSLog(@"pickedD called!");
    if(self.selectedChoice == 3)
    {
        self.btnAnswerD.selected = NO;
        self.selectedChoice = -1;
    }
    else
    {
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        self.btnAnswerD.selected = YES;
        self.selectedChoice = 3;
    }
}

- (IBAction)pickedE:(id)sender
{
    NSLog(@"pickedE called!");
    if(self.selectedChoice == 4)
    {
        self.btnAnswerE.selected = NO;
        self.selectedChoice = -1;
    }
    else
    {
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        self.btnAnswerE.selected = YES;
        self.selectedChoice = 4;
    }
}

- (IBAction)pickedPrevious:(id)sender
{
    NSLog(@"pickedPrevious called!");
    [self.btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [self.btnNext sizeToFit];
    if(self.quiz.currentIndex == 0)
    {
        NSLog(@"No previous question.");
    }
    else
    {
        [self.quiz addAnswer:self.selectedChoice atIndex:self.quiz.currentIndex];
        self.quiz.currentIndex--;
        [self showQuestionAtIndex:self.quiz.currentIndex];
        self.position.text = [NSString stringWithFormat:@"%d/%d", _quiz.currentIndex + 1, _quiz.itemCount];
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        if(self.quiz.currentAnswer != -1)
        {
            [(UIButton *)self.buttons[self.quiz.currentAnswer] setSelected:YES];
            self.selectedChoice = self.quiz.currentAnswer;
        }
        else
        {
            self.selectedChoice = -1;
        }
    }
    NSLog(@"%@", self.quiz.userAnswers);
}

- (IBAction)pickedNext:(id)sender
{
    NSLog(@"pickedNext called!");
    if(self.quiz.currentIndex == self.quiz.itemCount - 1)
    {
        NSLog(@"No next question.");
    }
    else
    {
        if(self.quiz.currentIndex == self.quiz.itemCount - 2)
        {
            [self.btnNext setTitle:@"Finish" forState:UIControlStateNormal];
            [self.btnNext sizeToFit];
        }
        [self.quiz addAnswer:self.selectedChoice];
        NSLog(@"%d", self.quiz.currentIndex);
        [self showQuestionAtIndex:self.quiz.currentIndex];
        self.position.text = [NSString stringWithFormat:@"%d/%d", _quiz.currentIndex + 1, _quiz.itemCount];
        for(UIButton *button in self.buttons)
        {
            button.selected = NO;
        }
        if(self.quiz.currentAnswer != -1)
        {
            [(UIButton *)self.buttons[self.quiz.currentAnswer] setSelected:YES];
            self.selectedChoice = self.quiz.currentAnswer;
        }
        else
        {
            self.selectedChoice = -1;
        }
    }
    NSLog(@"%@", self.quiz.userAnswers);
}

@end

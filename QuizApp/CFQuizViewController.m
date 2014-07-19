//
//  CFViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFQuizViewController.h"
#import "UIViewController+UIViewControllerAdditions.h"

@interface CFQuizViewController ()



@end

@implementation CFQuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _labels = [[NSMutableArray alloc] init];
    _buttons = [[NSMutableArray alloc] init];
    [_labels addObjectsFromArray:[NSArray arrayWithObjects:self.lblAnswerA,
                                      self.lblAnswerB, self.lblAnswerC,
                                      self.lblAnswerD, self.lblAnswerE, nil]];
    [_buttons addObjectsFromArray:[NSArray arrayWithObjects:self.btnAnswerA,
                                       self.btnAnswerB, self.btnAnswerC,
                                       self.btnAnswerD, self.btnAnswerE, nil]];
    _selectedChoice = -1;
    _position.text = [NSString stringWithFormat:@"%d/%d", _quiz.currentIndex + 1, _quiz.itemCount];

}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.quiz.name;
    if(self.quiz.finished)
    {
        for(int i = 0; i < self.quiz.userAnswers.count; i++)
        {
            self.quiz.userAnswers[i] = [NSNumber numberWithInt:-1];
        }
        [self showQuestionAtIndex:0];
        [self.btnNext setTitle:@"Next" forState:UIControlStateNormal];
        self.quiz.finished = NO;
        self.selectedChoice = -1;
    }
    [self showQuestionAtIndex:self.quiz.currentIndex];
    if(self.selectedChoice != -1)
    {
        [(UIButton *)self.buttons[self.selectedChoice] setSelected:YES];
    }
    if(self.quiz.currentIndex == self.quiz.quizItems.count - 1)
    {
        [self.btnNext setTitle:@"Finish" forState:UIControlStateNormal];
        [self.btnNext sizeToFit];
    }
    if(self.backViewController.navigationItem.title == nil)
    {
        self.backViewController.navigationItem.title = @"Quizzes";
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    self.scrollView.layer.borderColor = [UIColor blueColor].CGColor;
    self.scrollView.layer.borderWidth = 1.0f;
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
    self.quiz.currentIndex = index;
    [self.lblQuestion setText:[self.quiz currentQuestion]];
//    [self.lblQuestion sizeToFit];
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
    self.position.text = [NSString stringWithFormat:@"%d/%d", _quiz.currentIndex + 1, _quiz.itemCount];
}

- (IBAction)pickedA:(id)sender
{
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
    [self.btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [self.btnNext sizeToFit];
    if(self.quiz.currentIndex == 0)
    {

    }
    else
    {
        [self.quiz addAnswer:self.selectedChoice atIndex:self.quiz.currentIndex];
        self.quiz.currentIndex--;
        [self showQuestionAtIndex:self.quiz.currentIndex];
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
}

- (IBAction)pickedNext:(id)sender
{
    self.btnPrevious.hidden = NO;
    if(self.quiz.currentIndex == self.quiz.itemCount - 1)
    {
        [self.quiz addAnswer:self.selectedChoice atIndex:self.quiz.currentIndex];
        self.quiz.finished = YES;
        if(self.selectedChoice != -1)
        {
            [(UIButton *)self.buttons[self.selectedChoice] setSelected:NO];
        }
        [self performSegueWithIdentifier:@"displayResultsView" sender:self];
    }
    else
    {
        if(self.quiz.currentIndex == self.quiz.itemCount - 2)
        {
            [self.btnNext setTitle:@"Finish" forState:UIControlStateNormal];
            [self.btnNext sizeToFit];
        }
        [self.quiz addAnswer:self.selectedChoice];
        [self showQuestionAtIndex:self.quiz.currentIndex];
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
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"displayResultsView"])
    {
        CFResultsViewController *results = (CFResultsViewController *)segue.destinationViewController;
        [results setQuiz:self.quiz];
    }
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.quiz forKey:@"quiz"];
    [coder encodeInt:self.selectedChoice forKey:@"selectedChoice"];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    self.quiz = [coder decodeObjectForKey:@"quiz"];
    self.selectedChoice = [coder decodeIntForKey:@"selectedChoice"];
}

@end

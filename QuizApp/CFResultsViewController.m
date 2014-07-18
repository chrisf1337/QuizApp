//
//  CFResultsViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/16/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFResultsViewController.h"

@interface CFResultsViewController ()

@end

@implementation CFResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Results";
    int correct = 0;
    for(int i = 0; i < [self.quiz.quizItems count]; i++)
    {
        if([(NSNumber *)[self.quiz.quizItems[i] objectForKey:@"answer"] intValue] ==
           [(NSNumber *)self.quiz.userAnswers[i] intValue])
        {
            correct++;
        }
    }
    [self.lblResults setText:
     [NSString stringWithFormat:@"Correct: %d\nTotal: %d\nPercent correct: %.2f\n\nGoing back will restart the quiz.",
      correct,
      self.quiz.quizItems.count,
      (correct + 0.0) / self.quiz.quizItems.count * 100]];
    [self.lblResults sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

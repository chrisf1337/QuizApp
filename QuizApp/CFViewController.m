//
//  CFViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFViewController.h"

@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad called!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning called!");
}

- (IBAction)showQuestion:(id)sender
{
    NSLog(@"showQuestion called!");
    [[self lblQuestion] setText:@"First question"];
    [[self lblAnswerA] setText:@":) Answer A"];
    [[self lblAnswerB] setText:@":D Answer B"];
}

- (IBAction)pickedA:(id)sender
{
    NSLog(@"pickedA called!");
}

- (IBAction)pickedB:(id)sender
{
    NSLog(@"pickedB called!");
}

@end

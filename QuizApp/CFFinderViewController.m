//
//  CFQuizFinderViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/18/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFFinderViewController.h"
#import "UIViewController+UIViewControllerAdditions.h"

@interface CFFinderViewController ()

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

@implementation CFFinderViewController

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
    if(self.backViewController.navigationItem.title == nil)
    {
        self.backViewController.navigationItem.title = @"Quizzes";
    }
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

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSError *error;
    NSString *urlString = textField.text;
    if(![urlString hasPrefix:@"http"])
    {
        urlString = [NSString stringWithFormat:@"http://%@", urlString];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    textField.text = @"";
    NSData *fileContents = [NSData dataWithContentsOfURL:url];
    if(fileContents == nil)
    {
        [self showAlertWithTitle:@"Error" message:@"The URL you have entered is invalid."];
    }
    else
    {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fileContents
                                                             options:kNilOptions
                                                               error:&error];
        if(json == nil)
        {
            [self showAlertWithTitle:@"Error" message:@"There is no JSON file at the URL you have entered."];
        }
        else
        {
            NSString *quizName = [json objectForKey:@"name"];
            NSLog(@"%@", quizName);
            NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                               NSUserDomainMask, YES)[0];
            NSString *destPath = [documentsDirectory stringByAppendingPathComponent:
                                  [NSString stringWithFormat:@"%@.json", quizName]];
            [fileContents writeToFile:destPath atomically:YES];

            NSString *menuPath = [documentsDirectory stringByAppendingPathComponent:@"quizMenu.json"];
            fileContents = [NSData dataWithContentsOfFile:menuPath];
            json = [NSJSONSerialization JSONObjectWithData:fileContents
                                                   options:kNilOptions
                                                     error:&error];
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:json];
            NSMutableArray *menuItems = [NSMutableArray arrayWithArray:[dict objectForKey:@"items"]];
            if(![menuItems containsObject:quizName])
            {
                [menuItems addObject:quizName];
            }
            [dict setObject:menuItems forKey:@"items"];
            fileContents = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
            [fileContents writeToFile:menuPath atomically:YES];
            [self showAlertWithTitle:@"Quiz added"
                             message:[NSString stringWithFormat:@"%@ has been successfully added.", quizName]];
        }
    }
    return YES;
}

@end

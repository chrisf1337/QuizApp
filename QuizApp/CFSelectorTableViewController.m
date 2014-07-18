//
//  CFQuizSelectorTableViewController.m
//  QuizApp
//
//  Created by Christopher Fu on 7/17/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFSelectorTableViewController.h"

@interface CFSelectorTableViewController ()

@end

@implementation CFSelectorTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.quizzes = [[NSMutableArray alloc] init];


}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Quizzes";

    [self.quizzes removeAllObjects];
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSError *error;
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"quizMenu.json"];
    NSData *fileContents = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fileContents
                                                         options:kNilOptions
                                                           error:&error];
    NSArray *quizFilenames = [json objectForKey:@"items"];
    for(NSString *quizFilename in quizFilenames)
    {
        CFQuiz *quiz = [[CFQuiz alloc] initWithPath:
                        [documentsDirectory
                         stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json", quizFilename]]];
        [self.quizzes addObject:quiz];
    }
    NSLog(@"%d", self.quizzes.count);
    [(UITableView *)self.view reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.quizzes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"tableView:cellForRowAtIndexPath: called!");
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    // Configure the cell...
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    cell.textLabel.text = self.recipes[indexPath.row];
//    return cell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quizCell"];
    CFQuiz *quiz = self.quizzes[indexPath.row];
    cell.textLabel.text = quiz.name;
    cell.detailTextLabel.text = quiz.quizDescription;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedQuiz = self.quizzes[indexPath.row];
    [self performSegueWithIdentifier:@"displayQuizFromSelector" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"displayQuizFromSelector"])
    {
        CFQuizViewController *quizViewController = (CFQuizViewController *)segue.destinationViewController;
        [quizViewController setQuiz:self.selectedQuiz];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

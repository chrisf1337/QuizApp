//
//  CFAppDelegate.m
//  QuizApp
//
//  Created by Christopher Fu on 7/9/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFAppDelegate.h"

@implementation CFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSError *error;
    NSString *menuPath = [[NSBundle mainBundle] pathForResource:@"quizMenu" ofType:@"json"];
    NSString *destPath = [documentsDirectory stringByAppendingPathComponent:@"quizMenu.json"];
    NSData *fileContents = [NSData dataWithContentsOfFile:menuPath];
    if(![[NSFileManager defaultManager] fileExistsAtPath:destPath])
    {
        [fileContents writeToFile:destPath atomically:YES];
    }

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fileContents
                                                         options:kNilOptions
                                                           error:&error];
    NSArray *quizFilenames = [json objectForKey:@"items"];
    for(NSString *quizFilename in quizFilenames)
    {
        NSString *quizPath = [[NSBundle mainBundle] pathForResource:quizFilename ofType:@"json"];
        destPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json", quizFilename]];
        fileContents = [NSData dataWithContentsOfFile:quizPath];
        [fileContents writeToFile:destPath atomically:YES];
    }
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

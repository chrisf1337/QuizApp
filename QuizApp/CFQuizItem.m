//
//  CFQuizItem.m
//  QuizApp
//
//  Created by Christopher Fu on 7/11/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CFQuizItem.h"

@implementation CFQuizItem

- (instancetype)initWithQuestion:(NSString *)question choices:(NSMutableArray *)choices answerIndex:(int)answerIndex
{
    self = [super init];
    if(self)
    {
        _question = question;
        _choices = choices;
        _answerIndex = answerIndex;
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendString:self.question];
    for(int i = 0; i < [self.choices count]; i++)
    {
        [str appendFormat:@"%d. %@\n", i + 1, self.choices[i]];
    }
    return str;
}

@end

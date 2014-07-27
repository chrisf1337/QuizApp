//
//  CFQuiz.m
//  QuizApp
//
//  Created by Christopher Fu on 7/11/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import "CDFQuiz.h"

@implementation CDFQuiz

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self)
    {
        NSError *error;
        NSData *fileContents = [NSData dataWithContentsOfFile:path];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fileContents
                                                             options:kNilOptions
                                                               error:&error];
        _quizItems = [json objectForKey:@"items"];
        _name = [json objectForKey:@"name"];
        _quizDescription = [json objectForKey:@"description"];
        _path = path;
        _currentIndex = 0;
        _userAnswers = [NSMutableArray arrayWithCapacity:_quizItems.count];
        for (int i = 0; i < _quizItems.count; i++)
        {
            [_userAnswers addObject:[NSNumber numberWithInt:-1]];
        }
        _finished = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _quizItems = [aDecoder decodeObjectForKey:@"quizItems"];
        _userAnswers = [aDecoder decodeObjectForKey:@"userAnswers"];
        _path = [aDecoder decodeObjectForKey:@"path"];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _quizDescription = [aDecoder decodeObjectForKey:@"quizDescription"];
        _currentIndex = [aDecoder decodeIntForKey:@"currentIndex"];
        _finished = [aDecoder decodeBoolForKey:@"finished"];
    }
    return self;
}

- (void)addAnswer:(int)answer atIndex:(int)index
{
    self.userAnswers[index] = [NSNumber numberWithInt:answer];
}

- (void)addAnswer:(int)answer
{
    [self addAnswer:answer atIndex:self.currentIndex];
    self.currentIndex++;
}

- (void)pickChoice:(int)choice
{
    self.userAnswers[self.currentIndex] = [NSNumber numberWithInt:choice];
}

- (NSDictionary *)currentQuizItem
{
    return self.quizItems[self.currentIndex];
}

- (NSString *)currentQuestion
{
    return [self.quizItems[self.currentIndex] objectForKey:@"question"];
}

- (NSArray *)currentChoices
{
    return [self.quizItems[self.currentIndex] objectForKey:@"choices"];
}

- (int)currentAnswer
{
    return [(NSNumber *)self.userAnswers[self.currentIndex] intValue];
}

- (int)itemCount
{
    return self.quizItems.count;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Quiz at %@ (%d questions)", self.path, [self.quizItems count]];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.quizItems forKey:@"quizItems"];
    [aCoder encodeObject:self.userAnswers forKey:@"userAnswers"];
    [aCoder encodeObject:self.path forKey:@"path"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.quizDescription forKey:@"quizDescription"];
    [aCoder encodeInt:self.currentIndex forKey:@"currentIndex"];
    [aCoder encodeBool:self.finished forKey:@"finished"];
}

@end

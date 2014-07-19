//
//  CFQuiz.h
//  QuizApp
//
//  Created by Christopher Fu on 7/11/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFQuiz : NSObject <NSCoding>

@property (nonatomic) NSMutableArray *quizItems;
@property (nonatomic) NSMutableArray *userAnswers;
@property (nonatomic) NSString *path;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *quizDescription;
@property (nonatomic) int currentIndex;
@property (nonatomic) BOOL finished;

- (instancetype)initWithPath:(NSString *)path;

- (void)addAnswer:(int)answer atIndex:(int)index;
- (void)addAnswer:(int)answer;
- (NSDictionary *)currentQuizItem;
- (NSString *)currentQuestion;
- (NSArray *)currentChoices;
- (int)currentAnswer;
- (int)itemCount;
- (void)pickChoice:(int)choice;
- (NSString *)description;

@end

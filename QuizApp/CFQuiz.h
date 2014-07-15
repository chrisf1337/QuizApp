//
//  CFQuiz.h
//  QuizApp
//
//  Created by Christopher Fu on 7/11/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFQuiz : NSObject

@property (nonatomic) NSMutableArray *quizItems;
@property (nonatomic) NSMutableArray *userAnswers;
@property (nonatomic) NSString *path;
@property (nonatomic) int currentIndex;

- (instancetype)initWithPath:(NSString *)path;

- (void)addAnswer:(int)answer atIndex:(int)index;
- (void)addAnswer:(int)answer;
- (NSDictionary *)currentQuizItem;
- (NSString *)currentQuestion;
- (NSArray *)currentChoices;
- (int)currentAnswer;
- (int)itemCount;
- (void)pickChoice:(int)choice;

@end

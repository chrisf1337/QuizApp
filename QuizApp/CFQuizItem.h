//
//  CFQuizItem.h
//  QuizApp
//
//  Created by Christopher Fu on 7/11/14.
//  Copyright (c) 2014 Christopher Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFQuizItem : NSObject

@property (nonatomic) NSString* question;
@property (nonatomic) NSMutableArray *choices;
@property (nonatomic) int answerIndex;

- (instancetype)initWithQuestion:(NSString *)question choices:(NSMutableArray *)choices answerIndex:(int)answerIndex;
- (NSString *)description;

@end

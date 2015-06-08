//
//  PlayingCard.h
//  LearningObjectiveC
//
//  Created by Ryan Walberg on 2015-04-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#ifndef LearningObjectiveC_PlayingCard_h
#define LearningObjectiveC_PlayingCard_h

@import UIKit;
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

- (UIColor *)colour;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

#endif

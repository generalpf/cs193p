//
//  SetCard.h
//  Matchismo
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

@import UIKit;
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) UIColor *color;
// TODO: fill type?

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
+ (NSArray *)validColors;

@end

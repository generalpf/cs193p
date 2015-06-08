//
//  SetCard.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    // TODO
    
    return score;
}

- (NSString *)description
{
    NSMutableString *s = [[NSMutableString alloc] init];
    for (int i = 0; i < self.rank; i++) {
        [s appendString:self.suit];
        if (i < self.rank - 1) {
            [s appendString:@" "];
        }
    }
    return s;
}

@synthesize suit = _suit;
@synthesize color = _color;

+ (NSArray *)validSuits
{
    return @[@"▲", @"●", @"■"];
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[SetCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)validColors
{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
}

- (UIColor *)color
{
    return _color ? _color : [UIColor grayColor];
}

- (void)setColor:(UIColor *)color
{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

+ (NSUInteger)maxRank
{
    return 3;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank > 0 && rank <= [SetCard maxRank]) {
        _rank = rank;
    }
}

@end

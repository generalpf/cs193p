//
//  SetDeck.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [SetCard validSuits]) {
            for (UIColor *color in [SetCard validColors]) {
                for (NSUInteger rank = 1; rank <= [SetCard maxRank]; rank++) {
                    SetCard *card = [[SetCard alloc] init];
                    card.rank = rank;
                    card.suit = suit;
                    card.color = color;
                    [self addCard:card];
                }
            }
        }
    }
    
    return self;
}

@end

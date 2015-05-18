//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ryan Walberg on 2015-04-26.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

typedef void (^onMatchBlock)(NSInteger, NSArray *);

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index cardCount:(NSUInteger)cardCount onMatch:(onMatchBlock) onMatch;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end

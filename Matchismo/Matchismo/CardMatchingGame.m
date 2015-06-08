//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-04-26.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        
        self.chosenCards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

static const int MISMATCH_PENALTY = 2;

- (void)chooseCardAtIndex:(NSUInteger)index cardCount:(NSUInteger)cardCount onMatch:(onMatchBlock) onMatch
{
    Card *card = [self cardAtIndex:index];
    // matched cards are out of the game
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            [self.chosenCards removeObject:card];
        } else {
            card.chosen = YES;
            [self.chosenCards addObject:card];
            
            // have we chosen the right amount of cards?
            if ([self.chosenCards count] == cardCount) {
                // check for a match anywhere in here
                // start with card 0, check against 1..n
                // then check card 1 against 2..n
                // all the way up to n-1
                int bestMatchScore = 0;
                for (int i = 0; i < [self.chosenCards count] - 1; i++) {
                    Card *c = self.chosenCards[i];
                    int matchScore = [c match:[self.chosenCards subarrayWithRange:NSMakeRange(i + 1, [self.chosenCards count] - i - 1)]];
                    if (matchScore > bestMatchScore) {
                        bestMatchScore = matchScore;
                    }
                }
                // was there a match?
                if (bestMatchScore) {
                    self.score += bestMatchScore * (5 - cardCount);
                    onMatch(bestMatchScore * (5 - cardCount), self.chosenCards);
                } else {
                    self.score -= MISMATCH_PENALTY;
                    onMatch(-MISMATCH_PENALTY, self.chosenCards);
                }
                
                // unchoose all cards, and if positive points were scored, mark them matched
                for (Card *card in self.chosenCards) {
                    if (bestMatchScore) {
                        card.matched = YES;
                    } else {
                        card.chosen = NO;
                    }
                }
                [self.chosenCards removeAllObjects];
            }
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end

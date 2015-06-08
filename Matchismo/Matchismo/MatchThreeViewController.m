//
//  ViewController.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-04-17.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "MatchThreeViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface MatchThreeViewController ()

@end

@implementation MatchThreeViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    PlayingCard *playingCard = (PlayingCard *) card;
    UIColor *textColor = [playingCard color];
    return [[NSAttributedString alloc] initWithString:playingCard.description attributes:@{ NSForegroundColorAttributeName: textColor }];
}

@end

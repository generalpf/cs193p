//
//  ViewController.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-04-17.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchesRequired;
@end

@implementation ViewController

- (CardMatchingGame *)game
{
    self.matchesRequired.
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchDealButton:(UIButton *)sender
{
    // next call will re-init it
    _game = nil;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long) self.game.score];
   }
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    PlayingCard *playingCard = (PlayingCard *) card;
    if (!card.isChosen) {
        return nil;
    }
    UIColor *textColor = ([playingCard.suit isEqualToString:@"♣︎"] || [playingCard.suit isEqualToString:@"♠︎"]) ? [UIColor blackColor] : [UIColor redColor];
    return [[NSAttributedString alloc] initWithString:playingCard.description attributes:@{ NSForegroundColorAttributeName: textColor }];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end

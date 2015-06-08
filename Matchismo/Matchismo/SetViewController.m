//
//  SetViewController.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "SetViewController.h"
#import "SetDeck.h"
#import "SetCard.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (Deck *)createDeck
{
    return [[SetDeck alloc] init];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    SetCard *setCard = (SetCard *) card;
    UIColor *textColor = [setCard color];
    return [[NSAttributedString alloc] initWithString:setCard.description attributes:@{ NSForegroundColorAttributeName: textColor }];
}

@end

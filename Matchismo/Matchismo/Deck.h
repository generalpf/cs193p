//
//  Deck.h
//  LearningObjectiveC
//
//  Created by Ryan Walberg on 2015-04-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#include "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL) atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end

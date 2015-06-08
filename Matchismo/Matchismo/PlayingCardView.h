//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface PlayingCardView : CardView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end

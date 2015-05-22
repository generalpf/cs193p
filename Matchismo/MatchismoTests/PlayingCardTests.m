//
//  PlayingCardTests.m
//  Matchismo
//
//  Created by Ryan Walberg on 2015-05-18.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCard.h"

@interface PlayingCardTests : XCTestCase
@property (strong, nonatomic) PlayingCard *aceOfSpades;
@property (strong, nonatomic) PlayingCard *jackOfClubs;
@property (strong, nonatomic) PlayingCard *aceOfClubs;
@property (strong, nonatomic) PlayingCard *jackOfSpades;
@property (strong, nonatomic) PlayingCard *queenOfSpades;
@end

@implementation PlayingCardTests

- (void)setUp {
    [super setUp];
    
    self.aceOfSpades = [[PlayingCard alloc] init];
    self.aceOfSpades.rank = 1;
    self.aceOfSpades.suit = @"♠︎";
    
    self.jackOfClubs = [[PlayingCard alloc] init];
    self.jackOfClubs.rank = 11;
    self.jackOfClubs.suit = @"♣︎";
    
    self.aceOfClubs = [[PlayingCard alloc] init];
    self.aceOfClubs.rank = 1;
    self.aceOfClubs.suit = @"♣︎";
    
    self.jackOfSpades = [[PlayingCard alloc] init];
    self.jackOfSpades.rank = 11;
    self.jackOfSpades.suit = @"♠︎";
    
    self.queenOfSpades = [[PlayingCard alloc] init];
    self.queenOfSpades.rank = 12;
    self.queenOfSpades.suit = @"♠︎";
}

- (void)testMatchAgainstOne {
    XCTAssertEqual(0, [self.aceOfSpades match:@[ self.jackOfClubs ]]);
    
    XCTAssertEqual(1, [self.aceOfSpades match:@[ self.jackOfSpades ]]);
    
    XCTAssertEqual(4, [self.aceOfSpades match:@[ self.aceOfClubs ]]);
    
    XCTAssertEqual(4, [self.aceOfSpades match:@[ self.aceOfSpades ]]);
}

/*- (void)testMatchAgainstMany {
    XCTAssertEqual(2, [self.aceOfSpades match:@[ self.jackOfSpades, self.queenOfSpades ]]);
}*/

@end

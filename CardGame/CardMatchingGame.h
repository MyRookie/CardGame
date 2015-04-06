//
//  CardMatchingGame.h
//  CardGame
//
//  Created by rookie on 06/04/15.
//  Copyright (c) 2015 rookie studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"


@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;

-(void) chooseCardAtIndex:(NSUInteger) index;

-(Card*) cardAtIndex:(NSInteger) index;

@property (nonatomic,readonly) NSInteger score;

@end

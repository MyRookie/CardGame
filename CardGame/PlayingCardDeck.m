//
//  PlayingCardDeck.m
//  lecture1
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardDeck()

@end

@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    if(self){
        for(NSString* suit in [PlayingCard suitValid]){
            for(NSUInteger i = 0;i != [PlayingCard maxRank];++i){
                PlayingCard* card = [[PlayingCard alloc] init];
                card.rank = i;
                card.suit = suit;
                
                [self addCard:card];
            }
        }
    }
    
    
    return self;
}

@end

//
//  CardMatchingGame.m
//  CardGame
//
//  Created by rookie on 06/04/15.
//  Copyright (c) 2015 rookie studio. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray* cards;

@end

@implementation CardMatchingGame

-(NSMutableArray*)cards{
    if (_cards == nil) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    if(self != nil){
        for(NSUInteger i = 0; i != count; ++i){
            Card* card = [deck drawRandomCard];
            if(card != nil){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
        
    }
    return self;
}

-(Card*) cardAtIndex:(NSInteger)index{
    return (index < [self.cards count])?[self.cards objectAtIndex:index]:nil;
}

-(void) chooseCardAtIndex:(NSUInteger)index{
    Card* card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            //chose another card and match it with next chosen one;
            --self.score;
            for(Card* c in self.cards){
                if(c.isChosen && !c.isMatched){
                    NSInteger score = [c match:@[card]];
                    if(score){
                        self.score += score;
                        c.matched = YES;
                        card.matched = YES;
                        
                    }else{
                        c.chosen = NO;
                        card.chosen = NO;
                    }
                    break;
                }
            }
            card.chosen = YES;
        }
    }
}

@end

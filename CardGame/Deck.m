//
//  Deck.m
//  lecture1
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong,nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(NSMutableArray*)cards{
    if(_cards == nil) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void) addCard:(Card *)card atTop:(BOOL)top{
    if(top){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card *)card{
    [self.cards addObject:card];
}

-(void) printCards{
    for(Card* c in self.cards){
        NSLog(@"%@",c.content);
    }
}

-(Card*) drawRandomCard{
    Card* randomCard = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end

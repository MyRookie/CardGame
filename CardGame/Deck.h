//
//  Deck.h
//  lecture1
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card*)card atTop:(BOOL) top;
-(void) addCard:(Card *)card;
-(void) printCards;
-(Card*) drawRandomCard;

@end

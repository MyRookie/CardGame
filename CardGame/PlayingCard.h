//
//  PlayingCard.h
//  lecture1
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+(NSArray*) suitValid;
+(NSUInteger) maxRank;


@end

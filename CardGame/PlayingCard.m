//
//  PlayingCard.m
//  lecture1
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard
@synthesize rank = _rank;
@synthesize suit = _suit;

-(NSUInteger)match:(NSArray *)card{
    NSUInteger score = 0;
    
    PlayingCard* otherCard = [card firstObject];
    if([self.suit isEqualToString:otherCard.suit]){
        score += 2;
    }
    if(self.rank == otherCard.rank){
        score += 10;
    }
    return score;
}

+(NSArray*)suitValid{
    return @[@"♠︎",@"♦︎",@"♥︎",@"♣︎"];
}

+(NSArray*) rankString{
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank{
    return [[self rankString] count];
}

-(void) setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

-(void)setSuit:(NSString *)s{
    if([[PlayingCard suitValid] containsObject:s]){
        _suit = s;
    }
}


-(NSString*)suit{
    if(_suit == nil) _suit = @"?";
    return _suit;
}


-(NSString*)content{
    NSArray* rankString = [PlayingCard rankString];
    return [NSString stringWithFormat:@"%@%@",rankString[(int)self.rank],self.suit];
}



@end

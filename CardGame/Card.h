//
//  Card.h
//  lecture1
//
//  Created by rookie on 03/04/15.
//  Copyright (c) 2015 rookie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic,strong) NSString* content;
@property (nonatomic,setter=choose:,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

-(NSUInteger)match:(NSArray *)card;

@end

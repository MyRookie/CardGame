//
//  ViewController.m
//  CardGame
//
//  Created by rookie on 05/04/15.
//  Copyright (c) 2015 rookie studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

}

@property (strong,nonatomic) Deck* Deck;
@property (strong,nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *SCORE;


@end

@implementation ViewController


-(CardMatchingGame*)game{
    if(_game == nil) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck*)createDeck{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void) updateUI{
    for(UIButton* cardButton in self.cardButtons){
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cardButton setTitle:[self getTitle:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self getImage:card] forState:UIControlStateNormal];
        //cardButton.enabled = !card.isMatched;
    }
    self.SCORE.text = [NSString stringWithFormat:@"Score: %ld",self.game.score];
}

-(NSString*) getTitle:(Card*) card{
    if(card.isChosen){
        return card.content;
    }else{
        return @"";
    }
}

-(UIImage*) getImage:(Card*) card{
    if(card.isChosen){
        return [UIImage imageNamed:@"CardFront"];
    }else{
        return [UIImage imageNamed:@"CardBack"];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

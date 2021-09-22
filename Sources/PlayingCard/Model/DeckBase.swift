//
//  DeckBase.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//
import Foundation

open class DeckBase : Deck
{
    var noInSuites = [13,13,13,13,13,13,13,13,21,3]
    public func noCardIn(_ suite:PlayingCard.Suite) -> Int
    {
        return noInSuites[suite.rawValue]
    }
    public func middleCardIn(_ suite:PlayingCard.Suite) -> PlayingCard
    {
        return PlayingCard(suite:suite,value:PlayingCard.CardValue.pip((noInSuites[suite.rawValue]+1)/2))
    }
    public func lowerMiddleCardIn(_ suite:PlayingCard.Suite) -> PlayingCard
    {
        return PlayingCard(suite:suite,value:PlayingCard.CardValue.pip((noInSuites[suite.rawValue]-1)/2))
    }
    open var cards: [PlayingCard] {
       
        return orderedDeck.shuffle();
    }
    
    open func dealFor(_ numberOfPlayers:Int ) -> [[PlayingCard]]
    {
        let pack = cards;
        var hands: [[PlayingCard]] = [[PlayingCard]](repeating: [], count: numberOfPlayers)
        
        var i:Int = 0
        for card in pack
        {
            hands[i].append(card)
            i += 1;
            if(i>=numberOfPlayers)
            {
                i=0
            }
        }
        return hands
    }
    open func dealFor(_ numberOfPlayers:Int, each: Int ) -> (hands: [[PlayingCard]],remaining:[PlayingCard])?
    {
        if cards.count < numberOfPlayers * each
        {
            return nil
        }
        
        var remaining = cards
        var hands: [[PlayingCard]] = [[PlayingCard]](repeating: [], count: numberOfPlayers)
         
        for i in 0..<numberOfPlayers
        {
            for _ in 0..<each
            {
                let (card, leftover)  = remaining.dequeue
                remaining = leftover
                if let dealtCard = card
                {
                    hands[i].append(dealtCard)
                }
            }
        } 
        return (hands: hands, remaining: remaining)
    }
    open var orderedDeck:[PlayingCard]
    // override in derived class
    {
        return [];
    }
}

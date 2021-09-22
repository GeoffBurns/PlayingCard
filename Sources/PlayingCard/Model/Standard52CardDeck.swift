//
//  Standard52CardDeck.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import Foundation

open class Standard52CardDeck : DeckBase
{
    
    public static let sharedInstance = Standard52CardDeck()
    override open var orderedDeck:[PlayingCard]
    {
        var deck = [PlayingCard]();

        for s in PlayingCard.Suite.standardSuites
        {
            for v in PlayingCard.CardValue.standardValues
            {
               deck.append(PlayingCard(suite: s, value: v))
            }
        }
        return deck
    }
}

//
//  TestCardDeck.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import Foundation

open class TestCardDeck : DeckBase
{
var deck = [PlayingCard]();
    
public init(cards:[PlayingCard])
    {
        deck.append(contentsOf: cards)
    }
override open var orderedDeck:[PlayingCard]
    {
        return deck
    }
}

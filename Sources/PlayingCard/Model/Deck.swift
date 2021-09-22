//  Deck.swift
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//
import Foundation

public protocol Deck
{
    var cards: [PlayingCard] {get}
    func dealFor(_ numberOfPlayers:Int) -> [[PlayingCard]]
}

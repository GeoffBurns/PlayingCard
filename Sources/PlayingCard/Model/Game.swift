//
//  File.swift
//  
//
//  Created by Geoff Burns on 19/9/21.
//

import Foundation


public enum Game
{
    public static var rules : IGameRules = GameRules()
    public static var settings : IDeckOptions = DeckOptions()
    static var _deck  : BuiltCardDeck? = nil

    public static var deck  : BuiltCardDeck {
        if _deck == nil { newDeck() }
        return _deck! 
    }
    public static func newDeck() {
        _deck = BuiltCardDeck(deckOptions: settings)
    }
    public static func newDeck(with: IDeckOptions) {
        _deck = BuiltCardDeck(deckOptions: with)
    }
}

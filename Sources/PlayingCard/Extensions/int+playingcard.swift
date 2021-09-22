//
//  int+playingcard.swift
//  
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//


import Foundation

extension Int
{
    public func of(_ suite :PlayingCard.Suite) -> PlayingCard
    {
        return PlayingCard(suite: suite,value: cardValue)
    }
    
    public var cardValue : PlayingCard.CardValue
    {
        return PlayingCard.CardValue.pip(self)
    }
    public var letterDescription :String
    {
        switch self
        {
        case 3 : return "Three".localize
        case 4 : return "Four".localize
        case 5 : return "Five".localize
        case 6 : return "Six".localize
        case 7 : return "Seven".localize
        case 8 : return "Eight".localize
        case 9 : return "Nine".localize
        case 10 : return "Ten".localize
        case 11 : return "Eleven".localize
        case 12 : return "Twelve".localize
        case 13 : return "Thirteen".localize
        default : return self.description
        }
    }
    public var random : Int
    {
             return Int(arc4random_uniform(UInt32(self)))
    }
}

//
//  CardName.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import Foundation

public enum CardName
{
    case ace
    case king
    case queen
    case prince
    case princess
    case archer
    case knight
    case jack
    
    public var letter : String
        {
            switch(self)
            {
            case .ace :
                return "A"
            case .king :
                return "K"
            case .queen :
                return "Q"
            case .prince :
                return "PR"
            case .princess :
                return "PS"
            case .archer :
                return "AR"
            case .knight :
                return "KN"
            case .jack :
                return "J"
            }
    }
    public var cardValue : PlayingCard.CardValue
        {
            switch(self)
            {
            case .ace :
                return PlayingCard.CardValue.ace
            default :
                 return PlayingCard.CardValue.courtCard(letter)
            }
    }

    public func of(_ suite :PlayingCard.Suite) -> PlayingCard?
    {
        return PlayingCard(suite: suite,value: cardValue)
    }
}

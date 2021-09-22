//
//  string+playingcard.swift
//
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import Foundation

extension String {
    var suite : PlayingCard.Suite
        {
          switch(self)
                    {
                    case "S" : return .spades
                    case "H" : return .hearts
                    case "C" : return .clubs
                    case "D" : return .diamonds
                    case "U" : return .suns
                    case "A" : return .anchors
                    case "R" : return .stars
                    case "P" : return .picks
                    case "T" : return .trumps
                    case "J" : return .jokers
                    default : return .none
                    }
       
    }
    var cardvalue : PlayingCard.CardValue
        {
        
        if self=="A" {
            return PlayingCard.CardValue.ace
        } else if let num = Int(self) {
            return PlayingCard.CardValue.pip(num)
        } else {
            return PlayingCard.CardValue.courtCard(self)
        }
    }
    public var card : PlayingCard
    {

     let v = self.dropLast()
     let s = self.suffix(1)
     return PlayingCard(suite: String(s).suite, value: String(v).cardvalue)
    }
}
    

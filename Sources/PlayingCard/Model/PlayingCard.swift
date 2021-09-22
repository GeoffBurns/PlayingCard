//
//  PlayingCard.swift
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import SwiftUI
import Utilities

public struct PlayingCard : Equatable, Comparable, Hashable
{
    public enum Suite : Int, Equatable, Comparable
    {
        case spades
        case hearts
        case clubs
        case diamonds
        case suns
        case anchors
        case stars
        case picks
        case trumps
        case jokers
        case noOfSuites
        case none
        
        public var imageCode : String
            // Used to help create imagename for a card
            {
                switch(self)
                {
                case .spades: return "S"
                case .hearts: return "H"
                case .clubs:  return "C"
                case .diamonds: return "D"
                case .suns: return "U"
                case .anchors: return "A"
                case .stars : return "R"
                case .picks : return "P"
                case .trumps : return "T"
                case .jokers : return "J"
                case .noOfSuites : return ""
                case .none : return ""
                }
        }
        public var isLight : Bool
        {
            switch(self)
            {
            case .hearts: return true
            case .diamonds: return true
            case .suns: return true
            case .stars : return true
            default : return false
            }
        }
        public var isDark : Bool
        {
            switch(self)
            {
            case .spades: return true
            case .clubs: return true
            case .anchors: return true
            case .picks : return true
            default : return false
            }
        }
        public var isWild : Bool
        {
            switch(self)
            {
            case .trumps: return true
            case .jokers: return true
            default : return false
            }
        }
        public var singular : String
            // Used to help create imagename for a card
            {
                switch(self)
                {
                case .spades: return "Spade".localize
                case .hearts: return "Heart".localize
                case .clubs:  return "Club".localize
                case .diamonds: return "Diamond".localize
                case .suns: return "Sun".localize
                case .anchors: return "Anchor".localize
                case .stars : return "Star".localize
                case .picks : return "Pick".localize
                case .trumps : return "Trump".localize
                case .jokers : return "Joker".localize
                case .noOfSuites : return "Not Applicable".localize
                case .none : return "None".localize
                }
        }
        public var description : String
            // Used to help create imagename for a card
            {
                switch(self)
                {
                case .spades: return "Spades".localize
                case .hearts: return "Hearts".localize
                case .clubs:  return "Clubs".localize
                case .diamonds: return "Diamonds".localize
                case .suns: return "Suns".localize
                case .anchors: return "Anchors".localize
                case .stars : return "Stars".localize
                case .picks : return "Picks".localize
                case .trumps : return "Trumps".localize
                case .jokers : return "Jokers".localize
                case .noOfSuites : return "Not Applicable".localize
                case .none : return "None".localize
                }
        }
        public var color : Color
            {
                switch(self)
                {
                case .spades: return Color.black
                case .hearts: return Color(hex:"df0000")
                case .clubs:  return Color(hex:"1ea820")
                case .diamonds: return Color(hex:"16b4b7")
                case .suns: return Color(hex:"ffb002")
                case .anchors: return Color(hex:"0044cd")
                case .stars : return Color(hex:"ff6600")
                case .picks : return Color(hex:"841c00")
                case .trumps : return Color(hex:"5600b6")
                case .jokers : return Color(hex:"fb47f3")
                case .noOfSuites : return Color.black
                case .none : return Color.black
                }
        }
        public static var standardSuites : [Suite]
        {
            return [spades,diamonds,clubs,hearts]
        }
        public static var normalSuites : [Suite]
        {
            return [spades,diamonds,clubs,hearts,suns,anchors,stars,picks]
        }
        public static var allSuites : [Suite]
        {
            return [spades,diamonds,clubs,hearts,suns,anchors,stars,picks,trumps,jokers]
        }
    }
    public enum CardValue : Equatable, Comparable
    {
        case courtCard(String)
        case pip(Int)
        case ace
        
        public var imageCode : String
        // Used to help create imagename for a card
        {
                switch(self)
                {
                case .courtCard(let cardLetter): return cardLetter
                case .pip(let faceValue): return faceValue.description
                case .ace: return "A"
                }
        }
        public var localLetterRaw : String
        {
                switch(self)
                {
                case .courtCard(let cardLetter):
                    
                    switch cardLetter
                    {
                    case "J" : return "Jack_Letter".localize
                    case "KN" : return "Knight_Letter".localize
                    case "AR" : return "Archer_Letter".localize
                    case "PS" : return "Princess_Letter".localize
                    case "PR" : return "Prince_Letter".localize
                    case "Q" : return "Queen_Letter".localize
                    case "K" : return "King_Letter".localize
                    default : return ""
                    }
                default : return ""
                }
        }
        public var localLetter : String
            {
                let raw = localLetterRaw
                
                if raw == "" { return ""}
                switch(self)
                {
                case .courtCard(let cardLetter):
                    return cardLetter.lowercased() == raw.lowercased() ? "" : raw
                default : return ""
                }
        }
        public var description : String
            // Used to help create imagename for a card
            {
                switch(self)
                {
                case .courtCard(let cardLetter):
                    
                    switch cardLetter
                    {
                    case "J" : return "Jack".localize
                    case "KN" : return "Knight".localize
                    case "AR" : return "Archer".localize
                    case "PS" : return "Princess".localize
                    case "PR" : return "Prince".localize
                    case "Q" : return "Queen".localize
                    case "K" : return "King".localize
                    default : return "Page".localize
                    }
                case .pip(let faceValue):
                    switch faceValue
                    {
                    case 2 : return "Deuce".localize
                    case 3 : return "Trey".localize
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
                    default : return faceValue.description
                    }
                case .ace: return "Ace".localize
                }
        }
        
        
        public var rank : Int
            {
                switch(self)
                {
                case .courtCard(let cardLetter):
                    
                    switch cardLetter
                    {
                    case "K" : return 20
                    case "Q" : return 19
                    case "PR" : return 18
                    case "PS" : return 17
                    case "AR" : return 16
                    case "KN" : return 15
                    case "J" : return 14
                    default: return 0
                    }
                    
                case .pip(let faceValue): return faceValue
                case .ace: return 19
                }
        }
        
        public static func valuesFor(_ noOfCardsInASuite:Int = 13) -> [CardValue]
        {
            switch noOfCardsInASuite
            {
            case 10: return values10CardInASuite
            case 11: return values11CardInASuite
            case 12: return values12CardInASuite
            case 14: return values14CardInASuite
            case 15: return values15CardInASuite
            case 16: return values16CardInASuite
            case 17: return values17CardInASuite
            case 18: return values18CardInASuite
            case 19: return values19CardInASuite
            case 20: return values20CardInASuite
            default: return standardValues
            }
        }
        static func courtLiteValuesFor(_ noOfCardsInASuite:Int = 13) -> [CardValue]
        {
            switch noOfCardsInASuite
            {
            case 10: return values10CardInASuiteAlt
            case 11: return values11CardInASuiteAlt
            case 12: return values12CardInASuiteAlt
            case 14: return values14CardInASuiteAlt
            case 15: return values15CardInASuite
            case 16: return values16CardInASuite
            case 17: return values17CardInASuite
            case 18: return values18CardInASuite
            case 19: return values19CardInASuite
            case 20: return values20CardInASuite
            default: return standardValues
            }
        }
        public static func cardsUpTo(_ noOfCards:Int = 10) -> [CardValue]
        {
            return [ace] + (2...noOfCards).map { pip($0) }
        }
        public static var standardValues : [CardValue] {
            return  cardsUpTo(10) + ["J","Q","K"].map { courtCard($0) }
        }
        public static var values10CardInASuite : [CardValue] {
            
            return  cardsUpTo(7) + ["J","Q","K"].map { courtCard($0) }
        }
        public static var values11CardInASuite : [CardValue] {
            
            return  cardsUpTo(8) + ["J","Q","K"].map { courtCard($0) }
        }
        public static var values12CardInASuite : [CardValue] {
            
            return  cardsUpTo(9) + ["J","Q","K"].map { courtCard($0) }
        }
        public static var values10CardInASuiteAlt : [CardValue] {
            
            return  cardsUpTo(10)
        }
        public static var values11CardInASuiteAlt : [CardValue] {
            
            return  cardsUpTo(11)
        }
        public static var values12CardInASuiteAlt : [CardValue] {
            
             return  cardsUpTo(12)
        }
        public static var values14CardInASuiteAlt : [CardValue] {
            return cardsUpTo(11) +  ["J","Q","K"].map { courtCard($0) }
        }
        public static var values14CardInASuite : [CardValue] {
            
            return  cardsUpTo(10) + ["J","KN","Q","K"].map { courtCard($0) }
        }
        public static var values15CardInASuite : [CardValue] {
            
            return  cardsUpTo(11) + ["J","KN","Q","K"].map { courtCard($0) }
        }
        public static var values16CardInASuite : [CardValue] {
            
            return  cardsUpTo(12) +  ["J","KN","Q","K"].map { courtCard($0) }
        }
        public static var values17CardInASuite : [CardValue] {
            return  cardsUpTo(13) +  ["J","KN","Q","K"].map { courtCard($0) }
        }
        public static var values18CardInASuite : [CardValue]{
            return  cardsUpTo(12) + ["J","KN","AR","PS","Q","K"].map { courtCard($0) }
        }
        public static var values19CardInASuite : [CardValue]{
            return  cardsUpTo(12) + ["J","KN","AR","PS","PR","Q","K"].map { courtCard($0) }
        }
        public static var values20CardInASuite : [CardValue]{
            return  cardsUpTo(13) + ["J","KN","AR","PS","PR","Q","K"].map { courtCard($0) }
        }
    }
    
    public let suite: Suite
    public let value: CardValue
    
    public var imageName : String
        // create imagename for a card
    {
        let result = value.imageCode +  suite.imageCode
        if result == "0T" { return "0J"}
        return result
    }
    public var whiteImageName : String
    // create imagename for a card
    {
        return imageName +  "_"
    }
    public var description : String
        // create description for a card
        {
            switch(suite)
            {
            case PlayingCard.Suite.jokers:
                switch value.rank
                {
                case 0 : return "Fool".localize
                case 1 : return "Joker1".localize
                case 2 : return "Joker2".localize
                default:
                    return  "%@ of %@".localizeWith(value.description,suite.description)
                }
            case PlayingCard.Suite.trumps:
                switch value.rank
                {
                case 0 : return "Fool".localize
                case 1 : return "Magician".localize
                case 2 : return "Priestess".localize
                case 3 : return "Empress".localize
                case 4 : return "Emperor".localize
                case 5 : return "Hierophant".localize
                case 6 : return "Lovers".localize
                case 7 : return "Chariot".localize
                case 8 : return "Strength".localize
                case 9 : return "Hermit".localize
                case 10 : return "Fortune".localize
                case 11 : return "Justice".localize
                case 12 : return "Hanged Man".localize
                case 13 : return "Death".localize
                case 14 : return "Temperance".localize
                case 15 : return "Devil".localize
                case 16 : return "Tower".localize
                case 17 : return "The Star".localize
                case 18 : return "Moon".localize
                case 19 : return "The Sun".localize
                case 20 : return "Judgement".localize
                case 21 : return "World".localize
                default:
                    return  "%@ of %@".localizeWith(value.description,suite.description)
                }
            default:
                return  "%@ of %@".localizeWith(value.description,suite.description)
            }
    }
    
    
    public var hashValue: Int
        {
            return imageName.hashValue;
    }
    public func hash(into hasher: inout Hasher) {
        
        imageName.hash(into:&hasher)

    }
    public var isRicketyKate : Bool
        {
            return imageName == "QS"
    }
    
    public var isntRicketyKate : Bool
        {
            return !isRicketyKate
    }
    
   

    

 
}








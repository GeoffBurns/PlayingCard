//
//  DeckOptions.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//

import Foundation

public protocol IGameRules
{
    var isAceHigh  : Bool { get set}
}

public protocol IDeckOptions
{
    var noOfSuitesInDeck : Int { get }
    var noOfSuitesDefault : Int { get set }
    var noOfPlayersAtTable  : Int { get }
    var noOfCardsInASuite  : Int { get }
    var hasTrumps  : Bool { get }
    var hasJokers : Bool { get set}
    var hasFool : Bool { get }
    var isFoolATrump : Bool { get set}
    var useNumbersForCourtCards : Bool { get }
    var makeDeckEvenlyDivisible  : Bool { get }
    var willRemoveLow  : Bool { get set }
    var noOfTrumps : Int { get }
    var noOfStandardTrumps : Int { get }
    var noOfJokers : Int { get }
    var specialSuite : PlayingCard.Suite { get }
}
public class DeckOptions : IDeckOptions
{
    public var noOfCardsInASuite = 13
    public var noOfSuitesInDeck = 4
    public var noOfPlayersAtTable = 2
    public var hasTrumps = false
    public var hasJokers = false
    public var useNumbersForCourtCards = false
    public var willRemoveLow = true
    public var specialSuite: PlayingCard.Suite  = PlayingCard.Suite.none
    public var isFoolATrump = false
    public var noOfJokers = 2
    public var noOfStandardTrumps = 21
    public var noOfTrumps: Int { return hasFool ? noOfStandardTrumps + 1 : noOfStandardTrumps }
    public var isAceHigh =  true
    public var hasFool =  true
    public var makeDeckEvenlyDivisible  =  true
    public var noOfSuitesDefault : Int  = 5 
}
public class GameRules : IGameRules
{
    public var isAceHigh =  true
}
